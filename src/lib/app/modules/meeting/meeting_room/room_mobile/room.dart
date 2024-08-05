import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:openim_common/openim_common.dart';
import 'package:openmeeting/app/widgets/meeting/desktop/default_layout_view.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../../data/models/define.dart';
import '../../../../widgets/meeting/meeting_view.dart';
import '../../../../widgets/meeting/page_content.dart';
import '../../../../widgets/meeting/participant.dart';

class MeetingRoom extends MeetingView {
  const MeetingRoom(super.room, super.listener,
      {super.key, required super.roomID, super.onParticipantOperation, super.onOperation, super.options});

  @override
  MeetingViewState<MeetingRoom> createState() => _MeetingRoomState();
}

class _MeetingRoomState extends MeetingViewState<MeetingRoom> {
  ScrollPhysics? scrollPhysics;
  final _pageController = PageController();
  int _pages = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  customWatchedUser(String userID) {
    if (wasClickedUserID == userID) return;
    final track = participantTracks.firstWhereOrNull((e) =>
        e.participant.identity == userID &&
        (e.screenShareTrack != null && !e.screenShareTrack!.muted || e.videoTrack != null && !e.videoTrack!.muted));
    wasClickedUserID = track?.participant.identity;
    if (null != wasClickedUserID) sortParticipants();
  }

  _onPageChange(int pages) {
    setState(() {
      _pages = pages;
    });
  }

  _fixPages(int count) {
    _pages = min(_pages, count - 1);
    return count;
  }

  int get pageCount => _fixPages(
      (participantTracks.length % 4 == 0 ? participantTracks.length ~/ 4 : participantTracks.length ~/ 4 + 1) +
          (null == firstParticipantTrack ? 0 : 1));

  @override
  Widget buildChild() => Container(
        color: const Color(0xFF333333),
        child: anyOneHasVideo ? _buildGridView() : _buildDefaultView(),
      );

  Widget _buildDefaultView() {
    return DefaultLayoutView(
      participantTracks: participantTracks,
      defaultForMobile: true,
    );
  }

  Widget _buildGridView() {
    return Stack(
      children: [
        widget.room.remoteParticipants.isEmpty
            ? (localParticipantTrack == null
                ? const SizedBox()
                : GestureDetector(
                    onTap: toggleFullScreen,
                    child: ParticipantWidget.widgetFor(
                      localParticipantTrack!,
                      options: widget.options,
                      isZoom: false,
                      useScreenShareTrack: true,
                      audioEncouragement: meetingInfo?.setting.audioEncouragement == true,
                      onTapSwitchCamera: () {
                        localParticipantTrack!.toggleCamera();
                      },
                    )))
            : StatefulBuilder(
                builder: (v, status) {
                  return GestureDetector(
                    child: NotificationListener(
                      onNotification: (v) {
                        if (v is FirstPageZoomNotification) {
                          scrollPhysics = v.isZoom ? const NeverScrollableScrollPhysics() : null;
                          status.call(() {});
                          return true;
                        }
                        return false;
                      },
                      child: PageView.builder(
                        physics: scrollPhysics,
                        itemBuilder: (context, index) {
                          final existVideoTrack = null != firstParticipantTrack;
                          if (existVideoTrack && index == 0) {
                            return GestureDetector(
                              onTap: toggleFullScreen,
                              child: FirstPage(
                                participantTrack: firstParticipantTrack!,
                                options: widget.options,
                              ),
                            );
                          }
                          return OtherPage(
                            participantTracks: participantTracks,
                            pages: existVideoTrack ? index - 1 : index,
                            options: widget.options,
                            onDoubleTap: (t) {
                              setState(() {
                                customWatchedUser(t.participant.identity);
                                _pageController.jumpToPage(0);
                              });
                            },
                          );
                        },
                        itemCount: pageCount,
                        onPageChanged: _onPageChange,
                        controller: _pageController,
                      ),
                    ),
                  );
                },
              ),
        if (widget.room.remoteParticipants.isNotEmpty && pageCount > 1)
          Positioned(
            bottom: 8.h,
            child: PageViewDotIndicator(
              currentItem: _pages,
              count: pageCount,
              size: Size(8.w, 8.h),
              unselectedColor: Styles.c_FFFFFF_opacity50,
              selectedColor: Styles.c_FFFFFF,
            ),
          ),
        Positioned(
          right: 16.w,
          bottom: 16.h,
          child: ImageRes.meetingRotateScreen.toImage
            ..width = 44.w
            ..height = 44.h
            ..onTap = rotateScreen,
        )
      ],
    );
  }

  @override
  void onTapLayoutView(MxNLayoutViewType type) {}
}

class FirstPageZoomNotification extends Notification {
  bool isZoom;

  FirstPageZoomNotification({this.isZoom = false});
}
