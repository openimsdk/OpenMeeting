import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/widgets/meeting/overlay_widget.dart';
import 'package:popover/popover.dart';
import 'package:sprintf/sprintf.dart';

class MeetingAlertDialog {
  static void show(BuildContext context, String content,
      {String? title, String? confirmText, VoidCallback? onConfirm, String? cancelText, VoidCallback? onCancel}) {
    Logger.print('title:$title, content: $content');
    final forMobile = PlatformExt.isMobile;

    Widget buildContent(BuildContext ctx) {
      return CustomDialog(
        leftText: cancelText,
        rightText: confirmText,
        onTapLeft: () {
          if (forMobile) {
            OverlayWidget().hideDialog();
          } else {
            Navigator.of(context).pop();
          }
          onCancel?.call();
        },
        onTapRight: () {
          if (forMobile) {
            OverlayWidget().hideDialog();
          } else {
            Navigator.of(context).pop();
          }
          onConfirm?.call();
        },
        title: title,
        content: content,
      );
    }

    if (forMobile) {
      OverlayWidget().showDialog(context: context, child: buildContent(context));
    } else {
      showDialog(context: context, builder: (_) => buildContent(context));
    }
  }

  static void showDisconnect(BuildContext context, String content, {String? confirmText, VoidCallback? onConfirm}) {
    Logger.print('content: $content');
    final forMobile = PlatformExt.isMobile;

    Widget buildContent(BuildContext ctx) {
      return AlertDialog(
        content: Text(
          content,
          style: Styles.ts_0C1C33_17sp,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (forMobile) {
                OverlayWidget().hideDialog();
              } else {
                Navigator.of(context).pop();
              }
              onConfirm?.call();
            },
            child: Text(
              confirmText ?? StrRes.confirm,
              style: Styles.ts_0089FF_17sp,
            ),
          ),
        ],
      );
    }

    if (forMobile) {
      OverlayWidget().showDialog(context: context, child: buildContent(context));
    } else {
      showDialog(context: context, builder: (_) => buildContent(context));
    }
  }

  static void showMuteAll(
    BuildContext context, {
    ValueChanged<bool>? onConfirm,
  }) {
    bool checkBoxValue = true;
    final forMobile = PlatformExt.isMobile;

    Widget buildContent(BuildContext ctx) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StrRes.muteAllHint,
              style: Styles.ts_0C1C33_12sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StatefulBuilder(
                  builder: (BuildContext ctx, StateSetter setState) {
                    return Checkbox(
                        value: checkBoxValue,
                        onChanged: (value) {
                          setState(() {
                            checkBoxValue = value!;
                          });
                        });
                  },
                ),
                Text(
                  StrRes.allowMembersOpenMic,
                  style: Styles.ts_8E9AB0_12sp,
                ),
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            child: Text(StrRes.cancel, style: Styles.ts_0C1C33_12sp),
            onPressed: () {
              if (forMobile) {
                OverlayWidget().hideDialog();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          TextButton(
            child: Text(StrRes.confirm, style: Styles.ts_0C1C33_12sp),
            onPressed: () {
              if (forMobile) {
                OverlayWidget().hideDialog();
              } else {
                Navigator.of(context).pop();
              }
              onConfirm?.call(checkBoxValue);
            },
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.blue)),
          ),
        ],
      );
    }

    if (forMobile) {
      OverlayWidget().showDialog(context: context, child: buildContent(context));
    } else {
      showDialog(context: context, builder: (_) => buildContent(context));
    }
  }

  static void showEnterMeetingWithPasswordDialog(BuildContext context, String host,
      {ValueChanged<String>? onConfirm, VoidCallback? onCancel}) {
    final hostController = TextEditingController(text: sprintf(StrRes.meetingHostIs, [host]));
    final passwordController = TextEditingController();

    Widget buildContent(BuildContext ctx) {
      final textFiledDecoration = BoxDecoration(
        color: const CupertinoDynamicColor.withBrightness(
          color: CupertinoColors.white,
          darkColor: CupertinoColors.black,
        ),
        border: Border.all(color: Styles.c_E8EAEF),
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
      );

      return Dialog(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 206,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StrRes.enterMeeting,
                style: Styles.ts_0C1C33_17sp,
              ),
              const SizedBox(height: 12),
              CupertinoTextField(
                controller: hostController,
                enabled: false,
                decoration: textFiledDecoration,
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoTextField(
                controller: passwordController,
                decoration: textFiledDecoration,
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 38,
                      child: CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        borderRadius: BorderRadius.circular(4),
                        color: Styles.c_F4F5F7,
                        child: Text(
                          StrRes.cancel,
                          style: Styles.ts_0C1C33_14sp,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onCancel?.call();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 38,
                      child: CupertinoButton(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        borderRadius: BorderRadius.circular(4),
                        color: Styles.c_0089FF,
                        child: Text(
                          StrRes.confirm,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirm?.call(passwordController.text.trim());
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    showDialog(context: context, builder: (ctx) => buildContent(ctx));
  }

  MeetingAlertDialog.showMemberSetting(
    BuildContext context, {
    required ValueNotifier<({bool cameraIsEnable, bool micIsEnable, String nickname, String userID})> valueNotifier,
    required VoidCallback onEnableCamera,
    required VoidCallback onEnableMic,
    required VoidCallback? onChangeNickname,
    required VoidCallback? onSetHost,
    required VoidCallback? onKickoff,
  }) {
    final forMobile = PlatformExt.isMobile;

    Widget buildContent(BuildContext ctx) {
      void hideDialog() {
        if (forMobile) {
          OverlayWidget().hideDialog();
        } else {
          Navigator.of(context).pop();
        }
      }

      Widget buildItem(Widget icon, String title, VoidCallback onTap, {bool showDivider = true}) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListTile(
                dense: true,
                leading: icon,
                title: Text(title, style: Styles.ts_0C1C33_17sp),
                onTap: () {
                  hideDialog();
                  onTap();
                },
              ),
            ),
            if (showDivider) Divider(height: 1, color: Styles.c_E8EAEF),
          ],
        );
      }

      return Container(
        width: 300,
        padding: const EdgeInsets.only(bottom: 8),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: ValueListenableBuilder(
          valueListenable: valueNotifier,
          builder: (context, value, child) {
            Logger.print('dialog build');
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 52.h,
                  color: Color(0xFFF4F9FF),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(valueNotifier.value.nickname, style: Styles.ts_0C1C33_17sp),
                      CloseButton(
                        onPressed: () {
                          hideDialog();
                        },
                      ),
                    ],
                  ),
                ),
                buildItem(
                    Icon(
                      valueNotifier.value.cameraIsEnable ? Icons.video_camera_back_rounded : Icons.videocam_off_rounded,
                      color: Styles.c_8E9AB0,
                    ),
                    valueNotifier.value.cameraIsEnable ? StrRes.meetingCloseVideo : StrRes.requestEnableVideo,
                    onEnableCamera),
                buildItem(Icon(valueNotifier.value.micIsEnable ? Icons.mic : Icons.mic_off, color: Styles.c_8E9AB0),
                    valueNotifier.value.micIsEnable ? StrRes.meetingMute : StrRes.requestEnableAudio, onEnableMic),
                if (onChangeNickname != null)
                  buildItem(Icon(Icons.edit_note_sharp, color: Styles.c_8E9AB0), StrRes.changeNickname, () {
                    OverlayWidget().hideDialog();
                    onChangeNickname();
                  }),
                if (onSetHost != null)
                  buildItem(Icon(Icons.person_add_alt_1_rounded, color: Styles.c_8E9AB0), StrRes.setHost, onSetHost),
                if (onKickoff != null)
                  buildItem(Icon(Icons.person_remove_rounded, color: Colors.red), StrRes.kickoffFromMeeting, onKickoff,
                      showDivider: false),
              ],
            );
          },
        ),
      );
    }

    if (forMobile) {
      OverlayWidget().showDialog(context: context, child: buildContent(context));
    } else {
      showPopover(context: context, bodyBuilder: (_) => buildContent(context));
    }
  }

  MeetingAlertDialog.showInputText(
    BuildContext context, {
    String? title,
    required String nickname,
    required ValueChanged<String> onConfirm,
  }) {
    final forMobile = PlatformExt.isMobile;

    final textController = TextEditingController(text: nickname);
    final focusNode = FocusNode();

    Future.delayed(const Duration(milliseconds: 300), () {
      focusNode.requestFocus();
    });
    Widget buildContent(BuildContext ctx) {
      return Dialog(
        child: Container(
          width: 300,
          padding: const EdgeInsets.only(top: 16),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null) Text(title, style: Styles.ts_0C1C33_17sp),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CupertinoTextField(
                  controller: textController,
                  focusNode: focusNode,
                ),
              ),
              const Divider(
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text(StrRes.cancel),
                      onPressed: () {
                        if (forMobile) {
                          OverlayWidget().hideDialog();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  Container(height: 50, width: 1, color: Colors.grey.shade400),
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text(StrRes.confirm),
                      onPressed: () {
                        if (forMobile) {
                          OverlayWidget().hideDialog();
                        } else {
                          Navigator.of(context).pop();
                        }
                        onConfirm(textController.text.trim());
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    if (forMobile) {
      OverlayWidget().showDialog(context: context, child: buildContent(context));
    } else {
      showDialog(context: context, builder: (ctx) => buildContent(ctx));
    }
  }

  MeetingAlertDialog.showInProgressByTerminal(
    BuildContext context, {
    required VoidCallback onConfirm,
  }) {
    final forMobile = PlatformExt.isMobile;

    Widget buildContent(BuildContext ctx) {
      return Dialog(
        child: Container(
          width: 300,
          padding: const EdgeInsets.only(top: 16),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(StrRes.inProgressByTerminalHint, style: Styles.ts_0C1C33_17sp),
              ),
              const Divider(
                height: 1,
              ),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text(StrRes.cancel, style: TextStyle().copyWith(color: Colors.grey)),
                      onPressed: () {
                        if (forMobile) {
                          OverlayWidget().hideDialog();
                        } else {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ),
                  Container(height: 50, width: 1, color: Colors.grey.shade400),
                  Expanded(
                    child: CupertinoButton(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text(StrRes.restore),
                      onPressed: () {
                        if (forMobile) {
                          OverlayWidget().hideDialog();
                        } else {
                          Navigator.of(context).pop();
                        }
                        onConfirm();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    if (forMobile) {
      OverlayWidget().showDialog(context: context, child: buildContent(context));
    } else {
      showDialog(context: context, builder: (ctx) => buildContent(ctx));
    }
  }
}
