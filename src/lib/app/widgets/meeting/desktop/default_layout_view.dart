import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:openim_common/openim_common.dart';

import '../../../data/models/meeting_option.dart';
import '../participant.dart';
import '../participant_info.dart';

class DefaultLayoutView extends StatefulWidget {
  const DefaultLayoutView({
    super.key,
    required this.participantTracks,
    this.onDoubleTap,
    this.options,
    this.defaultForMobile = false,
  });

  final List<ParticipantTrack> participantTracks;
  final ValueChanged<ParticipantTrack>? onDoubleTap;
  final MeetingOptions? options;
  final bool defaultForMobile;

  @override
  State<DefaultLayoutView> createState() => _DefaultLayoutViewState();
}

class _DefaultLayoutViewState extends State<DefaultLayoutView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: widget.participantTracks
            .map((e) => widget.defaultForMobile
                ? _defaultWidgetForMobile(e)
                : SizedBox(width: 73, height: 105, child: _participantWidgetFor(e)))
            .toList(),
      ),
    );
  }

  Widget _defaultWidgetForMobile(ParticipantTrack track) {
    final name = track.nickname;
    final audioAvailable = track.participant.audioTrackPublications.firstOrNull?.muted == false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            AvatarView(
              text: name,
              height: 60.h,
              width: 60.h,
            ),
            Visibility(
              visible: track.isHost,
              child: Positioned(
                bottom: 2,
                child: SizedBox(
                  width: 16.h,
                  child: ImageRes.meetingPerson.toImage
                    ..width = 13.h
                    ..height = 13.h,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 40.h,
              child: Text(
                name,
                style: Styles.ts_FFFFFF_17sp,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
                child: (audioAvailable ? ImageRes.meetingMicOnWhite : ImageRes.meetingMicOffWhite).toImage
                  ..width = 20.h
                  ..height = 20.h),
          ],
        )
      ],
    );
  }

  Widget _participantWidgetFor(ParticipantTrack track) {
    Logger.print('_participantWidgetFor: ${track.participant.metadata}'
        'videoTrack:${track.videoTrack != null} '
        'screenShareTrack:${track.screenShareTrack != null} '
        'muted:${track.videoTrack?.muted} '
        'muted:${track.screenShareTrack?.muted}');
    return GestureDetector(
        onDoubleTap: () {
          widget.onDoubleTap?.call(track);
        },
        child: ParticipantWidget.widgetFor(track,
            useScreenShareTrack: track.screenShareTrack != null && !track.screenShareTrack!.muted,
            options: track.participant is LocalParticipant ? widget.options : null,
            backgroundColor: Colors.white));
  }
}
