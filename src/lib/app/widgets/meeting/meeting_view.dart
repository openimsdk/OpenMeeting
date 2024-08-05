import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:openim_common/openim_common.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sprintf/sprintf.dart';

import '../../data/models/define.dart';
import '../../data/models/meeting.pb.dart';
import '../../data/models/pb_extension.dart';
import '../../data/models/meeting_option.dart';
import '../../modules/meeting/meeting_room/meeting_client.dart';
import 'controls.dart';
import 'desktop/meeting_alert_dialog.dart';
import 'participant_info.dart';

abstract class MeetingView extends StatefulWidget {
  const MeetingView(
    this.room,
    this.listener, {
    super.key,
    required this.roomID,
    this.options,
    this.onOperation,
    this.onParticipantOperation,
    this.onSubjectInit,
  });

  final Room room;
  final EventsListener<RoomEvent> listener;
  final String roomID;
  final MeetingOptions? options;
  final void Function<T>(BuildContext? context, OperationType type, {T? value})? onOperation;
  final Future<bool> Function<T>({OperationParticipantType type, String userID, T to})? onParticipantOperation;
  final void Function(BehaviorSubject<MeetingInfoSetting> meetingInfoChangedSubject,
      BehaviorSubject<List<ParticipantTrack>> participantsSubject)? onSubjectInit;
}

abstract class MeetingViewState<T extends MeetingView> extends State<T> {
  final meetingInfoChangedSubject = BehaviorSubject<MeetingInfoSetting>();
  final participantsSubject = BehaviorSubject<List<ParticipantTrack>>();
  final startTimerCompleter = Completer<bool>();

  bool minimize = false;

  bool _enableFullScreen = false;

  //Alignment(0.9, -0.9),
  double alignX = 0.9;
  double alignY = -0.9;

  MeetingInfoSetting? meetingInfo;

  String? watchedUserID;

  String? wasClickedUserID;

  bool get joinDisabledMicrophone => meetingInfo?.setting.disableMicrophoneOnJoin == true;

  bool get joinDisabledVideo => meetingInfo?.setting.disableCameraOnJoin == true;

  String? get hostUserID => meetingInfo?.hostUserID;

  List<ParticipantTrack> participantTracks = [];

  EventsListener<RoomEvent> get _listener => widget.listener;

  bool get fastConnection => widget.room.engine.fastConnectOptions != null;

  ParticipantTrack? focusParticipantTrack;

  bool get _isLandscapeScreen {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape;
  }

  @override
  void initState() {
    widget.onSubjectInit?.call(meetingInfoChangedSubject, participantsSubject);
    widget.room.addListener(_onRoomDidUpdate);
    _setUpListeners();
    sortParticipants();
    _parseRoomMetadata();
    WidgetsBindingCompatible.instance?.addPostFrameCallback((_) {
      startTimerCompleter.complete(true);
      if (!fastConnection) {
        _askPublish();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    meetingInfoChangedSubject.close();
    participantsSubject.close();
    _portraitScreen();

    (() async {
      widget.room.removeListener(_onRoomDidUpdate);
      await _listener.dispose();
      await widget.room.localParticipant?.dispose();
      await widget.room.disconnect();
      await widget.room.dispose();
    })();

    super.dispose();
  }

  customWatchedUser(String userID);

  setWatchedTrack(ParticipantTrack track) {
    return track;
  }

  onMoveSmallWindow(DragUpdateDetails details) {
    final globalDy = details.globalPosition.dy;
    final globalDx = details.globalPosition.dx;
    setState(() {
      alignX = (globalDx - .5.sw) / .5.sw;
      alignY = (globalDy - .5.sh) / .5.sh;
    });
  }

  onTapMinimize() async {
    _portraitScreen();
    setState(() {
      minimize = true;
    });
  }

  onTapMaximize() {
    setState(() {
      minimize = false;
    });
  }

  onInviteMembers() async {
    onTapMinimize();
    Logger().printInfo(info: '========= onInviteMembers =======');
  }

  void rotateScreen() {
    if (_isLandscapeScreen) {
      _portraitScreen();
    } else {
      _landscapeScreen();
    }
  }

  void _portraitScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    if (mounted) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {});
      });
    }
  }

  void _landscapeScreen() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);

    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {});
    });
  }

  void toggleFullScreen() {
    setState(() {
      _enableFullScreen = !_enableFullScreen;
    });
  }

  void _setUpListeners() => _listener
    ..on<RoomDisconnectedEvent>((event) => _meetingClosed(event))
    ..on<RoomRecordingStatusChanged>((event) {})
    ..on<LocalTrackPublishedEvent>((_) => sortParticipants())
    ..on<LocalTrackUnpublishedEvent>((_) => sortParticipants())
    ..on<ParticipantConnectedEvent>((_) => sortParticipants())
    ..on<ParticipantDisconnectedEvent>((_) => sortParticipants())
    ..on<RoomMetadataChangedEvent>((event) => _parseRoomMetadata())
    ..on<TrackMutedEvent>((event) => sortParticipants())
    ..on<TrackUnmutedEvent>((event) => sortParticipants())
    ..on<DataReceivedEvent>((event) => parseDataReceived(event));

  void _askPublish() async {
    Logger.print('joinDisabledVideo: $joinDisabledVideo');
    Logger.print('joinDisabledMicrophone: $joinDisabledMicrophone');
    // video will fail when running in ios simulator
    try {
      final enable = !joinDisabledVideo && (widget.options?.enableVideo == true);
      await widget.room.localParticipant?.setCameraEnabled(enable);
    } catch (error) {
      Logger.print('could not publish video: $error');
    }
    try {
      final enable = !joinDisabledMicrophone && (widget.options?.enableMicrophone == true);
      await widget.room.localParticipant?.setMicrophoneEnabled(enable);
    } catch (error) {
      Logger.print('could not publish audio: $error');
    }
  }

  void _parseRoomMetadata() {
    Logger.print('room parseRoomMetadata: ${widget.room.metadata}');

    if (widget.room.metadata?.isNotEmpty == true) {
      final json = jsonDecode(widget.room.metadata!);
      meetingInfo = MeetingInfoSetting()..mergeFromProto3Json(json['detail']);
      meetingInfoChangedSubject.add(meetingInfo!);
      setState(() {});
    }
  }

  void _onRoomDidUpdate() {
    sortParticipants();
  }

  void sortParticipants() {
    List<ParticipantTrack> participantTracks = [];

    for (var participant in widget.room.remoteParticipants.values) {
      if (widget.roomID == participant.identity) {
        continue;
      }

      final track = _configureTrack(participant);
      participantTracks.add(setWatchedTrack(track));
    }

    if (null != localParticipantTrack) {
      participantTracks.add(localParticipantTrack!);
    }

    participantTracks.sort((a, b) {
      // joinedAt
      return a.participant.joinedAt.millisecondsSinceEpoch - b.participant.joinedAt.millisecondsSinceEpoch;
    });

    participantsSubject.add(participantTracks);

    setState(() {
      this.participantTracks = [...participantTracks];
    });
  }

  ParticipantTrack? get localParticipantTrack {
    if (widget.room.localParticipant != null) {
      final track = _configureTrack(widget.room.localParticipant!);

      return setWatchedTrack(track);
    }
    return null;
  }

  ParticipantTrack? get firstParticipantTrack {
    ParticipantTrack? track;
    if (watchedUserID != null) {
      track = participantTracks.firstWhere((e) => e.participant.identity == watchedUserID);
    } else if (wasClickedUserID != null) {
      track = participantTracks.firstWhere((e) => e.participant.identity == wasClickedUserID);
    } else if (focusParticipantTrack != null) {
      track = focusParticipantTrack;
    } else {
      track = participantTracks.firstWhereOrNull((e) => e.participant.hasVideo);
    }
    Logger.print('first watch track: ${track?.participant.identity} '
        'videoTrack:${track?.videoTrack == null} '
        'screenShareTrack:${track?.screenShareTrack == null} '
        'muted:${track?.videoTrack?.muted} '
        'muted:${track?.screenShareTrack?.muted}');
    return track;
  }

  ParticipantTrack _configureTrack(Participant participant) {
    VideoTrack? videoTrack;
    VideoTrack? screenShareTrack;
    for (final t in participant.videoTrackPublications) {
      if (t.isScreenShare) {
        screenShareTrack = t.track as VideoTrack?;
      } else {
        videoTrack = t.track as VideoTrack?;
      }
    }

    final track = ParticipantTrack(
      participant: participant,
      videoTrack: videoTrack,
      screenShareTrack: screenShareTrack,
      isHost: hostUserID == participant.identity,
    );

    return track;
  }

  bool get anyOneHasVideo => participantTracks.any((e) =>
      (e.screenShareTrack != null && !e.screenShareTrack!.muted) || (e.videoTrack != null && !e.videoTrack!.muted));

  void parseDataReceived(DataReceivedEvent event) {
    final result = NotifyMeetingData.fromBuffer(event.data);
    // kickofff
    if (result.hasKickOffMeetingData() &&
        result.kickOffMeetingData.userID == widget.room.localParticipant?.identity &&
        result.kickOffMeetingData.isKickOff) {
      widget.room.disconnect();
      widget.onOperation?.call(context, OperationType.kickOff);
      return;
    }

    if (!result.hasStreamOperateData()) return;

    final streamOperateData = result.streamOperateData;

    if (streamOperateData.operation.isEmpty || result.operatorUserID == widget.room.localParticipant?.identity) {
      return;
    }

    final operateUser = streamOperateData.operation.firstWhereOrNull((element) {
      return element.userID == widget.room.localParticipant?.identity;
    });

    if (operateUser == null) return;

    if (operateUser.hasCameraOnEntry()) {
      final cameraOnEntry = operateUser.cameraOnEntry;

      if (cameraOnEntry) {
        MeetingAlertDialog.show(context, sprintf(StrRes.requestXDoHint, [StrRes.meetingEnableVideo]),
            confirmText: StrRes.confirm, cancelText: StrRes.keepClose, onConfirm: () {
          widget.room.localParticipant?.setCameraEnabled(cameraOnEntry);
        });
      } else {
        widget.room.localParticipant?.setCameraEnabled(cameraOnEntry);
      }
    }

    if (operateUser.hasMicrophoneOnEntry()) {
      final microphoneOnEntry = operateUser.microphoneOnEntry;

      if (microphoneOnEntry) {
        MeetingAlertDialog.show(context, sprintf(StrRes.requestXDoHint, [StrRes.meetingUnmute]),
            confirmText: StrRes.confirm, cancelText: StrRes.keepClose, onConfirm: () {
          widget.room.localParticipant?.setMicrophoneEnabled(microphoneOnEntry);
        });
      } else {
        widget.room.localParticipant?.setMicrophoneEnabled(microphoneOnEntry);
      }
    }
  }

  void _meetingClosed(RoomDisconnectedEvent event) {
    Logger.print('_meetingClosed: ${event.reason}');

    if (PlatformExt.isDesktop && !Navigator.of(context).canPop()) {
      return;
    }

    final isHost = widget.room.localParticipant?.identity == meetingInfo?.hostUserID;

    if (event.reason == DisconnectReason.reconnectAttemptsExceeded) {
      MeetingAlertDialog.showDisconnect(context, 'Reconnect Attempts Exceeded', confirmText: StrRes.iKnew,
          onConfirm: () {
        widget.onOperation?.call(context, OperationType.onlyClose);
      });

      return;
    }

    if (event.reason == DisconnectReason.roomDeleted) {
      if (isHost) {
        return;
      }
      MeetingAlertDialog.showDisconnect(context, StrRes.meetingIsOver, confirmText: StrRes.iKnew, onConfirm: () {
        widget.onOperation?.call(context, OperationType.onlyClose);
      });
      return;
    }

    if (event.reason == DisconnectReason.participantRemoved) {
      MeetingAlertDialog.showDisconnect(context, StrRes.participantRemovedHit, confirmText: StrRes.iKnew,
          onConfirm: () {
        widget.onOperation?.call(context, OperationType.onlyClose);
      });

      return;
    }

    if (event.reason != DisconnectReason.disconnected || isHost) {
      return;
    }

    MeetingAlertDialog.show(
        context, event.reason == DisconnectReason.disconnected ? StrRes.meetingIsOver : StrRes.meetingClosedHint,
        confirmText: event.reason == DisconnectReason.disconnected ? StrRes.iKnew : null, onConfirm: () {
      widget.onOperation?.call(context, OperationType.leave);
    });
  }

  void _onTrackMuted(TrackMutedEvent event) {
    if (focusParticipantTrack != null && event.participant.identity == focusParticipantTrack!.participant.identity) {
      setState(() {
        focusParticipantTrack = null;
      });
    }

    final track = _configureTrack(event.participant);
    final index = participantTracks.indexWhere((element) => element.participant.identity == track.participant.identity);
    participantTracks[index] = track;

    participantsSubject.add(participantTracks);
  }

  void _onTrackUnMuted(TrackUnmutedEvent event) {
    if (wasClickedUserID != null || watchedUserID != null || focusParticipantTrack != null) return;
    final track = _configureTrack(event.participant);

    setState(() {
      focusParticipantTrack = track;
    });

    final index = participantTracks.indexWhere((element) => element.participant.identity == track.participant.identity);
    participantTracks[index] = track;

    participantsSubject.add(participantTracks);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedScale(
            scale: minimize ? 0 : 1,
            alignment: Alignment(alignX, alignY),
            duration: const Duration(milliseconds: 200),
            onEnd: () {},
            child: Material(
              color: PlatformExt.isDesktop ? Colors.white : Styles.c_000000,
              child: Stack(
                children: [
                  // ImageRes.liveBg.toImage
                  //   ..fit = BoxFit.cover
                  //   ..width = 1.sw
                  //   ..height = 1.sh,
                  if (widget.room.localParticipant != null)
                    ControlsView(
                      widget.room,
                      widget.room.localParticipant!,
                      meetingInfoChangedSubject: meetingInfoChangedSubject,
                      // onClose: widget.onClose,
                      onMinimize: onTapMinimize,
                      onInviteMembers: onInviteMembers,
                      participantsSubject: participantsSubject,
                      startTimerCompleter: startTimerCompleter,
                      enableFullScreen: _enableFullScreen,
                      options: widget.options,
                      hostUserInfo: UserInfo(
                          userID: MeetingClient().userInfo.userID, nickname: MeetingClient().userInfo.nickname),
                      onOperation: widget.onOperation,
                      onParticipantOperation: widget.onParticipantOperation,
                      onTapLayoutView: (type) {
                        onTapLayoutView(type);
                      },
                      child: buildChild(),
                    ),
                ],
              ),
            ),
          ),
          if (minimize)
            Align(
              alignment: Alignment(alignX, alignY),
              // alignment: const Alignment(0.9, -0.9),
              child: AnimatedOpacity(
                opacity: minimize ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onTapMaximize,
                  onPanUpdate: onMoveSmallWindow,
                  child: Container(
                    width: 84.w,
                    height: 101.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Styles.c_0C1C33_opacity60,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageRes.meetingVideo.toImage
                          ..width = 48.w
                          ..height = 48.h,
                        8.verticalSpace,
                        StrRes.videoMeeting.toText..style = Styles.ts_FFFFFF_12sp,
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );

  Widget buildChild();

  void onTapLayoutView(MxNLayoutViewType type);
}
