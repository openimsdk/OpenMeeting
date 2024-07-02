import 'package:flutter/material.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/data/models/meeting.pb.dart';

import '../../../data/models/define.dart';

class RoomSettingPanel extends StatefulWidget {
  const RoomSettingPanel({super.key, this.onOperation, required this.setting});

  final MeetingSetting setting;

  final Future<bool?> Function(RoomSetting setting, bool to)? onOperation;

  @override
  State<RoomSettingPanel> createState() => _RoomSettingPanelState();
}

class _RoomSettingPanelState extends State<RoomSettingPanel> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    items = [
      Item(
        setting: RoomSetting.lockMeeting,
        title: StrRes.lockMeeting,
        checked: widget.setting.lockMeeting,
      ),
      Item(
          setting: RoomSetting.defaultMuted,
          title: StrRes.defaultMuteMembers,
          checked: widget.setting.disableMicrophoneOnJoin),
      Item(
          setting: RoomSetting.allowParticipantUnMute,
          title: StrRes.allowMembersOpenMic,
          checked: widget.setting.canParticipantsUnmuteMicrophone),
      Item(
          setting: RoomSetting.allowParticipantVideo,
          title: StrRes.allowMembersOpenVideo,
          checked: widget.setting.canParticipantsEnableCamera),
      Item(
          setting: RoomSetting.onlyHostCanShareScreen,
          title: StrRes.onlyHostShareScreen,
          checked: !widget.setting.canParticipantsShareScreen),
      Item(
          setting: RoomSetting.audioEncouragement,
          title: StrRes.voiceMotivation,
          checked: widget.setting.audioEncouragement),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return _buildItem(index);
          },
          separatorBuilder: (context, index) => const Divider(
                color: Colors.white,
              ),
          itemCount: items.length),
    );
  }

  Widget _buildItem(int index) {
    final item = items[index];
    return Row(
      children: [
        Checkbox(
          value: item.checked,
          onChanged: (value) => onChanged(item.setting, !item.checked),
        ),
        Flexible(
          child: Text(
            items[index].title,
            style: Styles.ts_0C1C33_14sp,
          ),
        ),
      ],
    );
  }

  void onChanged(RoomSetting setting, bool value) {
    widget.onOperation?.call(setting, value).then((result) {
      if (result == true) {
        setState(() {
          items.firstWhere((element) => element.setting == setting).checked = value;
        });
      }
    });
  }
}

class Item {
  final RoomSetting setting;
  final String title;
  bool checked;

  Item({required this.setting, required this.title, required this.checked});
}
