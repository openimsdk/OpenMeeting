import 'dart:convert';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/meeting.pb.dart';
import 'package:openmeeting/app/data/models/pb_extension.dart';
import 'package:sprintf/sprintf.dart';
import '../../../../data/models/define.dart';
import '../../../../widgets/meeting/desktop/default_layout_view.dart';
import '../../../../widgets/meeting/desktop/meeting_alert_dialog.dart';
import '../../../../widgets/meeting/desktop/m_x_n_layout_view.dart';
import '../../../../widgets/meeting/meeting_view.dart';
import '../../../../widgets/meeting/participant_info.dart';

class MeetingDesktopRoom extends MeetingView {
  const MeetingDesktopRoom(
    super.room,
    super.listener, {
    super.key,
    required super.roomID,
    super.onParticipantOperation,
    super.options,
    super.onOperation,
    super.onSubjectInit,
  });

  @override
  MeetingViewState<MeetingDesktopRoom> createState() => _MeetingRoomState();
}

class _MeetingRoomState extends MeetingViewState<MeetingDesktopRoom> {
  //
  List<ParticipantTrack> participantTracks = [];
  EventsListener<RoomEvent> get _listener => widget.listener;
  bool get fastConnection => widget.room.engine.fastConnectOptions != null;
  ScrollPhysics? scrollPhysics;
  final _pageController = PageController();
  int _pages = 0;
  ParticipantTrack? focusParticipantTrack;

  MxNLayoutViewType _layoutViewType = MxNLayoutViewType.oneXn;

  @override
  void initState() {
    super.initState();
    widget.room.addListener(_onRoomDidUpdate);
    _setUpListeners();
    _sortParticipants();
    _parseRoomMetadata();
    WidgetsBindingCompatible.instance?.addPostFrameCallback((_) {
      startTimerCompleter.complete(true);
      if (!fastConnection) {
        _askPublish();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    // always dispose listener
    (() async {
      widget.room.removeListener(_onRoomDidUpdate);
      await _listener.dispose();
      // for (var e in widget.room.participants.values) {
      //   await e.dispose();
      // }
      await widget.room.localParticipant?.dispose();
      await widget.room.disconnect();
      await widget.room.dispose();
    })();
    super.dispose();
  }

  void _setUpListeners() => _listener
    ..on<RoomDisconnectedEvent>((event) => _meetingClosed(event))
    ..on<RoomRecordingStatusChanged>((event) {})
    ..on<LocalTrackPublishedEvent>((_) => _sortParticipants())
    ..on<LocalTrackUnpublishedEvent>((_) => _sortParticipants())
    ..on<ParticipantConnectedEvent>((_) => _sortParticipants())
    ..on<ParticipantDisconnectedEvent>((_) => _sortParticipants())
    ..on<RoomMetadataChangedEvent>((event) => _parseRoomMetadata())
    ..on<TrackMutedEvent>((event) => _sortParticipants())
    ..on<TrackUnmutedEvent>((event) => _sortParticipants())
    ..on<DataReceivedEvent>((event) => _parseDataReceived(event));

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

  void _parseDataReceived(DataReceivedEvent event) {
    final result = NotifyMeetingData.fromBuffer(event.data);

    if (result.hasKickOffMeetingData() &&
        result.kickOffMeetingData.userID.isNotEmpty &&
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
            forMobile: true, confirmText: StrRes.confirm, cancelText: StrRes.keepClose, onConfirm: () {
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
            forMobile: true, confirmText: StrRes.confirm, cancelText: StrRes.keepClose, onConfirm: () {
          widget.room.localParticipant?.setMicrophoneEnabled(microphoneOnEntry);
        });
      } else {
        widget.room.localParticipant?.setMicrophoneEnabled(microphoneOnEntry);
      }
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
  customWatchedUser(String userID) {
    if (wasClickedUserID == userID) return;
    final track = participantTracks.firstWhereOrNull((e) =>
        e.participant.identity == userID &&
        (e.screenShareTrack != null && !e.screenShareTrack!.muted || e.videoTrack != null && !e.videoTrack!.muted));
    wasClickedUserID = track?.participant.identity;
    if (null != wasClickedUserID) _sortParticipants();
  }

  void _onRoomDidUpdate() {
    _sortParticipants();
  }

  void _sortParticipants() {
    List<ParticipantTrack> participantTracks = [];

    for (var participant in widget.room.remoteParticipants.values) {
      if (widget.roomID == participant.identity) {
        continue;
      }

      final track = _configureTrack(participant);
      participantTracks.add(setWatchedTrack(track));
    }

    if (null != _localParticipantTrack) {
      participantTracks.add(_localParticipantTrack!);
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

  ParticipantTrack? get _firstParticipantTrack {
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

  ParticipantTrack? get _localParticipantTrack {
    if (widget.room.localParticipant != null) {
      final track = _configureTrack(widget.room.localParticipant!);

      return setWatchedTrack(track);
    }
    return null;
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

  // _onPageChange(int pages) {
  //   setState(() {
  //     _pages = pages;
  //   });
  // }

  _fixPages(int count) {
    _pages = min(_pages, count - 1);
    return count;
  }

  int get pageCount => _fixPages(
      (participantTracks.length % 4 == 0 ? participantTracks.length ~/ 4 : participantTracks.length ~/ 4 + 1) +
          (null == _firstParticipantTrack ? 0 : 1));

  @override
  Widget buildChild() {
    return Container(
      color: Colors.white,
      child: Stack(children: [
        anyOneHasVideo
            ? MxNLayoutView(
                focusParticipantTrack: _firstParticipantTrack,
                participantTracks: participantTracks,
                options: widget.options,
                layoutViewType: _layoutViewType,
                onDoubleTap: (track) {
                  setState(() {
                    wasClickedUserID = track.participant.identity;
                  });
                },
              )
            : DefaultLayoutView(
                participantTracks: participantTracks,
                options: widget.options,
              ),
      ]),
    );
  }

  void _meetingClosed(RoomDisconnectedEvent event) {
    Logger.print('_meetingClosed: ${event.reason}');

    if (!Navigator.of(context).canPop()) {
      return;
    }

    if (event.reason == DisconnectReason.roomDeleted) {
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

    if (event.reason != DisconnectReason.disconnected ||
        meetingInfo?.creatorUserID == widget.room.localParticipant?.identity) {
      return;
    }

    MeetingAlertDialog.show(
        context, event.reason == DisconnectReason.disconnected ? StrRes.meetingIsOver : StrRes.meetingClosedHint,
        confirmText: event.reason == DisconnectReason.disconnected ? StrRes.iKnew : null, onConfirm: () {
      widget.onOperation?.call(context, OperationType.onlyClose);
    });
  }

  @override
  void onTapLayoutView(MxNLayoutViewType type) {
    setState(() {
      _layoutViewType = type;
    });
  }
}

class FirstPageZoomNotification extends Notification {
  bool isZoom;

  FirstPageZoomNotification({this.isZoom = false});
}
