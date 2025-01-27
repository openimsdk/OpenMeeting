import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/meeting.pb.dart';
import 'package:openmeeting/app/data/models/pb_extension.dart';
import 'package:openmeeting/app/widgets/meeting/desktop/meeting_alert_dialog.dart';
import '../../../../core/app_controller.dart';
import '../../../../core/data_sp.dart';
import '../../../../core/multi_window_manager.dart';
import '../../../../routes/m_navigator.dart';
import '../../../data/models/meeting_option.dart';
import '../../../data/services/repository/repository_adapter.dart';
import '../meeting_room/meeting_client.dart';

class MeetingDetailController extends GetxController {
  final userInfo = Get.find<AppController>().userInfo!;

  final meetingInfo = Rx(MeetingInfoSetting());
  late String meetingCreator;
  late int startTime;
  late int endTime;

  final IMeetingRepository repository;

  MeetingDetailController({required this.repository});

  @override
  void onInit() {
    meetingInfo.value = Get.arguments['meetingInfo'] as MeetingInfoSetting;
    meetingCreator = meetingInfo.value.creatorNickname;
    startTime = meetingInfo.value.scheduledTime;
    endTime = meetingInfo.value.endTime;

    repository.getMeetingInfo(meetingInfo.value.meetingID, meetingInfo.value.creatorUserID).then((value) {
      if (value != null) {
        meetingInfo.value = value;
      }
    });
    super.onInit();
  }

  String get meetingStartTime => DateUtil.formatDateMs(startTime, format: 'HH:mm');

  String get meetingEndTime => DateUtil.formatDateMs(endTime, format: 'HH:mm');

  String get meetingStartDate => DateUtil.formatDateMs(startTime, format: IMUtils.getTimeFormat1());

  String get meetingEndDate => DateUtil.formatDateMs(endTime, format: IMUtils.getTimeFormat1());

  String get meetingNo => meetingInfo.value.meetingID;

  bool get isMine => meetingInfo.value.creatorUserID == userInfo.userId;

  String get meetingDuration {
    final offset = meetingInfo.value.duration;
    return '${offset ~/ (60 * 1000)}${StrRes.minute}';
  }

  bool isStartedMeeting() {
    final start = DateUtil.getDateTimeByMs(meetingInfo.value.scheduledTime);
    final now = DateTime.now();
    return start.difference(now).isNegative;
  }

  void copy() {
    IMUtils.copy(text: meetingInfo.value.meetingID);
  }

  Future<({String? password, bool lockMeeting})> getMeetingPassword(String meetingID, String userID) async {
    final result = await repository.getMeetingInfo(meetingID, userID);

    return (password: result?.password, lockMeeting: result?.setting.lockMeeting ?? false);
  }

  enterMeeting(String? password) async {
    if (MeetingClient().isBusy) {
      IMViews.showToast(StrRes.callingBusy);
      return;
    }

    final isEnableMicrophone = DataSp.getMeetingEnableMicrophone();
    final isEnableSpeaker = DataSp.getMeetingEnableSpeaker();
    final isEnableVideo = DataSp.getMeetingEnableVideo();
    final videoIsMirroring = DataSp.getMeetingEnableVideoMirroring();

    final cert = await repository.joinMeeting(meetingInfo.value.meetingID, userInfo.userId, password: password);

    if (cert == null) {
      return;
    }

    if (PlatformExt.isDesktop) {
      windowsManager.newRoom(
          UserInfo(userID: userInfo.userId, nickname: userInfo.nickname), cert, meetingInfo.value.meetingID);
    } else {
      await MeetingClient().connect(Get.context!,
          url: cert.url,
          token: cert.token,
          roomID: meetingInfo.value.meetingID,
          options: MeetingOptions(
            enableMicrophone: isEnableMicrophone,
            enableSpeaker: isEnableSpeaker,
            enableVideo: isEnableVideo,
            videoIsMirroring: videoIsMirroring,
          ));
    }

    Get.back();
  }

  editMeeting() {
    Get.bottomSheet(
      BottomSheetView(
        items: [
          SheetItem(label: StrRes.updateMeetingInfo, onTap: _modifyMeetingInfo),
          SheetItem(
            label: StrRes.cancelMeeting,
            textStyle: Styles.ts_FF381F_17sp,
            onTap: _cancelMeeting,
          ),
        ],
      ),
    );
  }

  _cancelMeeting() {
    MeetingAlertDialog.show(Get.context!, StrRes.cancelMeetingConfirmHit, onConfirm: () async {
      final result = await repository.endMeeting(meetingInfo.value.meetingID, userInfo.userId, MeetingEndType.CancelType);

      if (result) {
        IMViews.showToast(StrRes.changedSuccessfully);
        Get.back();
      }
    });
  }

  _modifyMeetingInfo() => MNavigator.startBookMeeting(
        meetingInfo: meetingInfo.value,
        offAndToNamed: true,
      );
}
