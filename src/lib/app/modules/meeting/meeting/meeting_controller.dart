import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/meeting.pb.dart';
import 'package:openmeeting/app/data/models/pb_extension.dart';
import 'package:openmeeting/core/app_controller.dart';
import 'package:openmeeting/core/extension.dart';
import 'package:openmeeting/routes/app_navigator.dart';
import 'package:sprintf/sprintf.dart';
import 'package:window_manager/window_manager.dart';
import 'package:common_utils/common_utils.dart';
import 'package:fixnum/fixnum.dart';

import '../../../../core/data_sp.dart';
import '../../../../core/multi_window_manager.dart';
import '../../../../routes/m_navigator.dart';
import '../../../data/models/define.dart';
import '../../../data/models/meeting_option.dart';
import '../../../data/services/repository/repository_adapter.dart';
import '../meeting_room/meeting_client.dart';

class MeetingController extends GetxController with WindowListener {
  final meetingInfoList = <MeetingInfoExt>[].obs;
  final nicknameMapping = <String, String>{}.obs;
  final userInfo = Get.find<AppController>().userInfo!;
  final customPopupMenuController = CustomPopupMenuController();
  final IMeetingRepository repository;

  MeetingController({required this.repository});

  final showPopEnableCamera = false.obs;
  bool isEnableVideo = DataSp.getMeetingEnableVideo(); // only desktop

  @override
  void onInit() {
    super.onInit();
    queryUnfinishedMeeting();
    // queryMeetingInTimer();

    windowManager.addListener(this);

    windowsManager.setMethodHandler((call, fromWindowId) async {
      Logger.print("[Main] call ${call.method} with args ${call.arguments} from window $fromWindowId");
      if (call.method == WindowEvent.sendMessage.rawValue) {
        final params = Map<String, dynamic>.from(call.arguments);
        final isBusy = params['isBusy'];
        final isKickoff = params['isKickoff'];

        if (isKickoff != null) {
          if (isKickoff) {
            _backToLogin();
          } else {
            queryUnfinishedMeeting();
          }
        }
        if (isBusy != null) {
          MeetingClient().busy = isBusy;
        }
      }
    });

    windowsManager.registerActiveWindowListener(onActiveWindowChanged);
  }

  /// Window status callback
  Future<void> onActiveWindowChanged() async {
    Logger.print("[MultiWindowHandler] active window changed: ${windowsManager.getActiveWindows()}");
    if (windowsManager.getActiveWindows().isEmpty) {
      // close all sub windows
      try {
        if (Platform.isLinux) {
          await Future.wait([windowsManager.closeAllSubWindows()]);
        } else {
          await windowsManager.closeAllSubWindows();
        }
      } catch (err) {
        Logger.print("$err");
      } finally {
        Logger.print("Start closing Open Meeting...");
        await windowManager.setPreventClose(false);
        await windowManager.close();
      }
    }
  }

  @override
  void onReady() {
    MeetingClient().onClose = (kickoff) {
      if (kickoff) {
        _backToLogin();
      } else {
        queryUnfinishedMeeting();
      }
    };
    super.onReady();
  }

  @override
  onClose() {
    super.onClose();
    windowsManager.setMethodHandler(null);
  }

  void _backToLogin() {
    DataSp.removeLoginCertificate();
    AppNavigator.startBackLogin();
    IMViews.showToast('10010'.tr);
  }

  @override
  void onWindowClose() {
    super.onWindowClose();
    Logger.print('[Main] ==== onWindowClose');
    Future.delayed(Duration.zero, () async {
      exit(0);
    });
  }

  Future queryUnfinishedMeeting() async {
    final result = await repository.getUnfinished(userInfo.userId);
    final r = groupMeetingsByDate(result);

    meetingInfoList.assignAll(r);
    meetingInfoList.refresh();

    return true;
  }

  Future onRefresh() {
    return queryUnfinishedMeeting();
  }

  void queryMeetingInTimer() {
    Timer.periodic(2.seconds, (_) {
      queryUnfinishedMeeting();
    });
  }

  List<MeetingInfoExt> groupMeetingsByDate(List<MeetingInfoSetting> meetings) {
    Map<String, List<MeetingInfoSetting>> groupedMap = {};
    meetings.sort((a, b) {
      final aIsToday = DateUtil.isToday(a.scheduledTime);
      final bIsToday = DateUtil.isToday(b.scheduledTime);

      bool aInProgress = a.status == MeetingStatus.inProgress;
      bool bInProgress = b.status == MeetingStatus.inProgress;

      if (aIsToday && aInProgress && !(bIsToday && bInProgress)) {
        return -1;
      } else if (!(aIsToday && aInProgress) && bIsToday && bInProgress) {
        return 1;
      } else {
        return 0;
      }
    });

    for (var meeting in meetings) {
      String formattedDate = DateUtil.formatDateMs(meeting.scheduledTime, format: 'yyyy-MM-dd');

      if (groupedMap.containsKey(formattedDate)) {
        groupedMap[formattedDate]!.add(meeting);
      } else {
        groupedMap[formattedDate] = [meeting];
      }
    }

    List<MeetingInfoExt> groupedMeetings = [];

    groupedMap.forEach((date, meetings) {
      final isToday = DateUtil.isToday(meetings.first.scheduledTime);

      groupedMeetings.add(MeetingInfoExt(isHeader: true, dateStr: isToday ? '${StrRes.today} $date' : date));
      groupedMeetings.addAll(
        meetings.map((meeting) => MeetingInfoExt(meetingInfo: meeting)).toList(),
      );
    });

    return groupedMeetings;
  }

  Future<({String? password, bool lockMeeting})> getMeetingPassword(String meetingID, String userID) async {
    final result = await repository.getMeetingInfo(meetingID, userID);

    return (password: result?.password, lockMeeting: result?.setting.lockMeeting ?? false);
  }

  String getMeetingDuration(MeetingInfoSetting meetingInfo) {
    final startTime = DateUtil.formatDateMs(
      meetingInfo.scheduledTime,
      format: 'HH:mm',
    );
    final endTime = DateUtil.formatDateMs(
      meetingInfo.scheduledTime + meetingInfo.duration,
      format: 'HH:mm',
    );
    return "$startTime-$endTime ${meetingInfo.meetingID.splitStringEveryNChars()}";
  }

  bool isStartedMeeting(MeetingInfoSetting meetingInfo) {
    final start = DateUtil.getDateTimeByMs(meetingInfo.scheduledTime);
    final now = DateTime.now();
    return start.difference(now).isNegative;
  }

  void joinMeeting() {
    if (MeetingClient().isBusy) {
      IMViews.showToast(StrRes.callingBusy);
      return;
    }
    MNavigator.startJoinMeeting();
  }

  void meetingDetail(MeetingInfoSetting meetingInfo) => MNavigator.startMeetingDetail(
        meetingInfo,
        meetingInfo.creatorNickname,
      );

  void quickMeeting() async {
    if (MeetingClient().isBusy) {
      IMViews.showToast(StrRes.callingBusy);
      return;
    }

    if (PlatformExt.isMobile) {
      final result = await MNavigator.startEnableCamera();
      isEnableVideo = result;
    }

    final isEnableMicrophone = DataSp.getMeetingEnableMicrophone();
    final isEnableSpeaker = DataSp.getMeetingEnableSpeaker();
    final videoIsMirroring = DataSp.getMeetingEnableVideoMirroring();

    final result = await repository.createMeeting(
      type: CreateMeetingType.quick,
      creatorUserID: userInfo.userId,
      creatorDefinedMeetingInfo: CreatorDefinedMeetingInfo(
          title: _meetingName,
          scheduledTime: Int64(DateTime.now().millisecondsSinceEpoch),
          meetingDuration: Int64(1 * 60 * 60)),
      setting: MeetingSetting(
          canParticipantsEnableCamera: true,
          canParticipantsShareScreen: true,
          canParticipantsUnmuteMicrophone: true,
          disableCameraOnJoin: false,
          disableMicrophoneOnJoin: false),
    );

    if (result.cert == null) {
      return;
    }
    if (PlatformExt.isDesktop) {
      windowsManager.newRoom(userInfo.toPBUser(), result.cert!, result.info.meetingID);
    } else {
      MeetingClient().connect(
        Get.context!,
        url: result.cert!.url,
        token: result.cert!.token,
        roomID: result.info.meetingID,
        options: MeetingOptions(
          enableMicrophone: isEnableMicrophone,
          enableSpeaker: isEnableSpeaker,
          enableVideo: isEnableVideo,
          videoIsMirroring: videoIsMirroring,
        ),
      );
    }
  }

  void quickEnterMeeting(String meetingID, {String? password}) async {
    if (MeetingClient().isBusy) {
      IMViews.showToast(StrRes.callingBusy);
      return;
    }

    final isEnableMicrophone = DataSp.getMeetingEnableMicrophone();
    final isEnableSpeaker = DataSp.getMeetingEnableSpeaker();
    final isEnableVideo = DataSp.getMeetingEnableVideo();
    final videoIsMirroring = DataSp.getMeetingEnableVideoMirroring();

    final cert = await repository.joinMeeting(meetingID, userInfo.userId, password: password);

    if (cert == null) {
      return;
    }

    if (PlatformExt.isDesktop) {
      windowsManager.newRoom(userInfo.toPBUser(), cert, meetingID);
    } else {
      MeetingClient().connect(Get.context!,
          url: cert.url,
          token: cert.token,
          roomID: meetingID,
          options: MeetingOptions(
            enableMicrophone: isEnableMicrophone,
            enableSpeaker: isEnableSpeaker,
            enableVideo: isEnableVideo,
            videoIsMirroring: videoIsMirroring,
          ));
    }
  }

  Future logout() async {
    await repository.logout();

    MeetingClient().close(logout: true);
    await DataSp.removeLoginCertificate();

    return;
  }

  String get _meetingName => sprintf(StrRes.meetingInitiatorIs, [userInfo.nickname]);
}

class MeetingInfoExt {
  bool isHeader;
  MeetingInfoSetting? meetingInfo;
  String? dateStr;

  MeetingInfoExt({this.isHeader = false, this.meetingInfo, this.dateStr});
}
