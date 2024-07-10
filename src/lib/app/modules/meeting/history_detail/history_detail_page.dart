import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/define.dart';
import 'package:openmeeting/app/data/models/pb_extension.dart';
import 'package:sprintf/sprintf.dart';

import '../../../widgets/meeting/desktop/meeting_alert_dialog.dart';
import 'history_detail_controller.dart';

class HistoryDetailPage extends GetView<HistoryDetailController> {
  const HistoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(StrRes.meetingDetail),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildInfoView(), _buildJoinView()],
        ),
      ),
    );
  }

  Widget _buildInfoView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageRes.meetingHistoryDetailIcon.toImage
                ..width = 17
                ..height = 17,
              4.horizontalSpace,
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: controller.meetingInfo.meetingName.toText
                  ..style = Styles.ts_0C1C33_17sp_medium
                  ..maxLines = 1
                  ..overflow = TextOverflow.ellipsis,
              ),
            ],
          ),
          6.verticalSpace,
          controller.getMeetingDuration().toText
            ..style = Styles.ts_8E9AB0_14sp
            ..maxLines = 1
            ..overflow = TextOverflow.ellipsis,
          6.verticalSpace,
          if (controller.meetingInfo.creatorNickname.isNotEmpty)
            sprintf(StrRes.meetingOrganizerIs, [controller.meetingInfo.creatorNickname]).toText
              ..style = Styles.ts_8E9AB0_14sp
              ..maxLines = 1
              ..overflow = TextOverflow.ellipsis,
        ],
      ),
    );
  }

  Widget _buildJoinView() {
    return Container(
      alignment: Alignment.topCenter,
      height: 102.h,
      padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
      color: Colors.white,
      child: controller.meetingInfo.status == MeetingStatus.completed
          ? Text(
              StrRes.meetingIsEnded,
              style: Styles.ts_8E9AB0_17sp,
            )
          : LayoutBuilder(
              builder: (context, constraints) => SizedBox.fromSize(
                size: Size(constraints.maxWidth, 44),
                child: CupertinoButton.filled(
                  borderRadius: BorderRadius.circular(6),
                  padding: EdgeInsets.zero,
                  child: Text(StrRes.joinMeeting),
                  onPressed: () {},
                ),
              ),
            ),
    );
  }

  void showCheckPasswordDialog() async {
    if (controller.meetingInfo.creatorUserID == controller.userInfo.userId) {
      controller.quickEnterMeeting(controller.meetingInfo.meetingID);

      return;
    }

    if (controller.meetingInfo.isLocked) {
      IMViews.showToast(StrRes.meetingIsLocked);

      return;
    }

    if (controller.meetingInfo.password?.isEmpty == true) {
      controller.quickEnterMeeting(controller.meetingInfo.meetingID);

      return;
    }

    MeetingAlertDialog.showEnterMeetingWithPasswordDialog(Get.context!, controller.meetingInfo.creatorNickname,
        onConfirm: (password) async {
      final result = controller.meetingInfo.password == password;

      if (!result) {
        IMViews.showToast(StrRes.wrongMeetingPassword);
      } else {
        controller.quickEnterMeeting(controller.meetingInfo.meetingID, password: password);
      }
    });
  }
}
