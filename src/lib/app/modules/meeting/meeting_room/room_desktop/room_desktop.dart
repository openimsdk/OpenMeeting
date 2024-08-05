import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/define.dart';
import '../../../../widgets/meeting/desktop/default_layout_view.dart';
import '../../../../widgets/meeting/desktop/m_x_n_layout_view.dart';
import '../../../../widgets/meeting/meeting_view.dart';

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
  ScrollPhysics? scrollPhysics;
  final _pageController = PageController();
  int _pages = 0;

  MxNLayoutViewType _layoutViewType = MxNLayoutViewType.oneXn;

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

  _fixPages(int count) {
    _pages = min(_pages, count - 1);
    return count;
  }

  int get pageCount => _fixPages(
      (participantTracks.length % 4 == 0 ? participantTracks.length ~/ 4 : participantTracks.length ~/ 4 + 1) +
          (null == firstParticipantTrack ? 0 : 1));

  @override
  Widget buildChild() {
    return Container(
      color: Colors.white,
      child: Stack(children: [
        anyOneHasVideo
            ? MxNLayoutView(
                focusParticipantTrack: firstParticipantTrack,
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
