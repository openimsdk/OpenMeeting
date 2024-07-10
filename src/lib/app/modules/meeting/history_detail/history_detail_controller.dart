import 'package:common_utils/common_utils.dart';
import 'package:get/get.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/meeting.pb.dart';
import 'package:openmeeting/app/data/models/pb_extension.dart';
import 'package:openmeeting/core/extension.dart';

import '../../../../core/app_controller.dart';
import '../../../../core/data_sp.dart';
import '../../../../core/multi_window_manager.dart';
import '../../../data/models/meeting_option.dart';
import '../../../data/services/repository/repository_adapter.dart';
import '../meeting_room/meeting_client.dart';

class HistoryDetailController extends GetxController {
  //TODO: Implement HistoryDetailController.
  final MeetingInfoSetting meetingInfo;
  final IMeetingRepository repository;

  HistoryDetailController({required this.meetingInfo, required this.repository});

  final userInfo = Get.find<AppController>().userInfo!;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String getMeetingCreateDate() {
    return DateUtil.formatDateMs(
      meetingInfo.scheduledTime,
      format: Get.locale?.languageCode == 'zh' ? 'MM月dd日' : 'MM/dd',
    );
  }

  String getMeetingDuration() {
    final startTime = DateUtil.formatDateMs(
      meetingInfo.scheduledTime,
      format: 'HH:mm',
    );
    final endTime = DateUtil.formatDateMs(
      meetingInfo.scheduledTime + meetingInfo.duration,
      format: 'HH:mm',
    );
    return "${getMeetingCreateDate()} $startTime-$endTime ${meetingInfo.meetingID.splitStringEveryNChars()}";
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
}
