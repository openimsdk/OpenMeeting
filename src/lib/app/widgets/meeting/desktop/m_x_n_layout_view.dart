import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:openim_common/openim_common.dart';

import '../../../data/models/define.dart';
import '../../../data/models/meeting_option.dart';
import '../participant.dart';
import '../participant_info.dart';

class MxNLayoutView extends StatefulWidget {
  const MxNLayoutView(
      {super.key,
      required this.focusParticipantTrack,
      required this.participantTracks,
      this.layoutViewType = MxNLayoutViewType.oneXn,
      this.options,
      this.onTap,
      this.onDoubleTap});

  final ParticipantTrack? focusParticipantTrack;
  final List<ParticipantTrack> participantTracks;
  final MeetingOptions? options;
  final VoidCallback? onTap;
  final ValueChanged<ParticipantTrack>? onDoubleTap;
  final MxNLayoutViewType layoutViewType;

  @override
  State<MxNLayoutView> createState() => _MxNLayoutViewState();
}

class _MxNLayoutViewState extends State<MxNLayoutView> {
  final _gridViewKey = GlobalKey();

  ParticipantTrack? _focusParticipantTrack;
  final PageController _pageController = PageController();

  int _crossAxisCount = 2;
  double itemHeight = 100.0;
  double childAspectRatio = 16.0 / 9.0;

  List<ParticipantTrack> get _participantTracks => widget.participantTracks;

  @override
  void initState() {
    super.initState();
    _focusParticipantTrack = widget.focusParticipantTrack;
    _crossAxisCount = widget.layoutViewType.rawValue;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateLayoutViwe();
    });
  }

  @override
  void didUpdateWidget(covariant MxNLayoutView oldWidget) {
    _focusParticipantTrack = widget.focusParticipantTrack;
    _crossAxisCount = widget.layoutViewType.rawValue;
    _updateLayoutViwe();
    Logger.print('didUpdateWidget: ${widget.layoutViewType.rawValue}');
    super.didUpdateWidget(oldWidget);
  }

  void _updateLayoutViwe() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _gridViewKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        final gridViewHeight = renderBox.size.height / _crossAxisCount;
        final gridViewWidth = renderBox.size.width / _crossAxisCount;

        setState(() {
          childAspectRatio = gridViewWidth / gridViewHeight;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.layoutViewType) {
      case MxNLayoutViewType.oneXn:
        return _buildOneXn();
      case MxNLayoutViewType.twoXtwo:
        return _buildNXM();
      case MxNLayoutViewType.threeXthree:
        return _buildNXM();
      default:
        return _buildOneXn();
    }
  }

  Widget _buildOneXn() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_focusParticipantTrack != null)
          Flexible(
            child: _participantWidgetFor(_focusParticipantTrack!),
          ),
        const SizedBox(
          width: 8,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 186),
          child: ListView.separated(
            itemBuilder: (context, index) =>
                SizedBox(width: 186, height: 105, child: _participantWidgetFor(widget.participantTracks[index])),
            itemCount: widget.participantTracks.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          ),
        )
      ],
    );
  }

  Widget _buildNXM() {
    int itemsPerPage = _crossAxisCount * _crossAxisCount;
    int pages = ((widget.participantTracks.length) / itemsPerPage).ceil();

    return PageView.builder(
      controller: _pageController,
      itemCount: pages,
      itemBuilder: (context, pageIndex) {
        int startIndex = pageIndex * itemsPerPage;
        int endIndex = startIndex + itemsPerPage;
        List<ParticipantTrack> pageItems = _participantTracks.sublist(
          startIndex,
          endIndex > _participantTracks.length ? _participantTracks.length : endIndex,
        );

        return GridView.builder(
          key: _gridViewKey,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _crossAxisCount,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: pageItems.length,
          itemBuilder: (context, index) {
            final participantTrack = pageItems[index];

            return _participantWidgetFor(participantTrack);
          },
        );
      },
    );
  }

  Widget _participantWidgetFor(ParticipantTrack track) {
    Logger.print('_participantWidgetFor: ${track.participant.metadata}'
        'videoTrack:${track.videoTrack != null} '
        'screenShareTrack:${track.screenShareTrack != null} '
        'muted:${track.videoTrack?.muted} '
        'muted:${track.screenShareTrack?.muted}');
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTap: () {
        widget.onDoubleTap?.call(track);
      },
      child: ParticipantWidget.widgetFor(
        track,
        useScreenShareTrack: track.screenShareTrack != null && !track.screenShareTrack!.muted,
        options: widget.options,
        focusModel: true,
      ),
    );
  }
}
