import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/meeting.pb.dart';

class MeetingSettingsSheetView extends StatefulWidget {
  const MeetingSettingsSheetView({
    super.key,
    this.controller,
    required this.setting,
    this.onConfirm,
  });
  final AnimationController? controller;
  final MeetingSetting setting;
  final ValueChanged<MeetingSetting>? onConfirm;

  @override
  State<MeetingSettingsSheetView> createState() => _MeetingSettingsSheetViewState();
}

class _MeetingSettingsSheetViewState extends State<MeetingSettingsSheetView> {
  @override
  void dispose() {
    super.dispose();
  }

  void _onLockMeeting(value) {
    setState(() {
      widget.setting.lockMeeting = value;
    });
  }

  void _onAudioEncouragement(value) {
    setState(() {
      widget.setting.audioEncouragement = value;
    });
  }

  _onAllowParticipantUnmute(value) {
    setState(() {
      widget.setting.canParticipantsUnmuteMicrophone = value;
    });
  }

  _onAllowParticipantVideo(value) {
    setState(() {
      widget.setting.canParticipantsEnableCamera = value;
    });
  }

  _onOnlyHostCanShareScreen(value) {
    setState(() {
      widget.setting.canParticipantsShareScreen = !value;
    });
  }

  _onJoinMeetingDefaultMute(value) {
    setState(() {
      widget.setting.disableMicrophoneOnJoin = value;
    });
  }

  _confirm() => widget.controller?.reverse().then((value) => widget.onConfirm?.call(widget.setting));

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.r),
              topRight: Radius.circular(14.r),
            ),
          ),
          child: Column(
            children: [
              14.verticalSpace,
              Stack(
                alignment: Alignment.center,
                children: [
                  StrRes.meetingSettings.toText..style = Styles.ts_0C1C33_17sp_medium,
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: _confirm,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 16.w,
                        ),
                        child: StrRes.determine.toText..style = Styles.ts_0089FF_17sp,
                      ),
                    ),
                  )
                ],
              ),
              8.verticalSpace,
              _buildItemView(
                label: StrRes.lockMeeting,
                value: widget.setting.lockMeeting,
                subLabel: StrRes.lockMeetingHint,
                onChanged: _onLockMeeting,
              ),
              8.verticalSpace,
              _buildItemView(
                label: StrRes.defaultMuteMembers,
                value: widget.setting.disableMicrophoneOnJoin,
                onChanged: _onJoinMeetingDefaultMute,
              ),
              8.verticalSpace,
              _buildItemView(
                label: StrRes.allowMembersOpenMic,
                value: widget.setting.canParticipantsUnmuteMicrophone,
                onChanged: _onAllowParticipantUnmute,
              ),
              _buildItemView(
                label: StrRes.allowMembersOpenVideo,
                value: widget.setting.canParticipantsEnableCamera,
                onChanged: _onAllowParticipantVideo,
              ),
              _buildItemView(
                label: StrRes.onlyHostShareScreen,
                value: !widget.setting.canParticipantsShareScreen,
                onChanged: _onOnlyHostCanShareScreen,
              ),
              8.verticalSpace,
              _buildItemView(
                label: StrRes.voiceMotivation,
                value: widget.setting.audioEncouragement,
                subLabel: StrRes.voiceMotivationHint,
                onChanged: _onAudioEncouragement,
              ),
              8.verticalSpace,
              /*
              _buildItemView(
                label: StrRes.onlyHostInviteMember,
                value: _onlyHostCanInvite,
                onChanged: _onOnlyHostCanInvite,
              ),
               */
            ],
          ),
        ),
      );

  Widget _buildItemView({
    required String label,
    required bool value,
    String? subLabel,
    ValueChanged<bool>? onChanged,
  }) =>
      Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 46.h,
              child: Row(
                children: [
                  Expanded(
                    child: label.toText..style = Styles.ts_0C1C33_17sp,
                  ),
                  CupertinoSwitch(
                    value: value,
                    onChanged: onChanged,
                    activeColor: Styles.c_0089FF,
                  ),
                ],
              ),
            ),
            if (subLabel != null)
              Text(
                subLabel,
                style: Styles.ts_8E9AB0_12sp,
              ),
          ],
        ),
      );
}
