import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollList extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Axis scrollDirection;
  final double speed; // pixels per 20ms

  const AutoScrollList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.horizontal,
    this.speed = 1.0,
  });

  @override
  State<AutoScrollList> createState() => _AutoScrollListState();
}

class _AutoScrollListState extends State<AutoScrollList> {
  late ScrollController _scrollController;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // Start auto-scroll after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    const duration = Duration(milliseconds: 20);
    _timer = Timer.periodic(duration, (timer) {
      if (_scrollController.hasClients) {
        // Move by 'speed' pixels
        double newOffset = _scrollController.offset + widget.speed;

        // If we are getting too far, we could reset, but with 100k items
        // and standard usage, we just keep scrolling.
        // Max scroll extent is huge.
        // If we ever reach max, we wrap to 0 (though visual jump might occur if not careful,
        // but 100k items loop is effectively infinite for hours).
        if (newOffset >= _scrollController.position.maxScrollExtent) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(newOffset);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 100,000 items to simulate infinity.
    // The builder will use index % widget.itemCount to loop content.
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: widget.scrollDirection,
      physics: const NeverScrollableScrollPhysics(), // Disable user interaction
      itemCount: 100000,
      itemBuilder: (context, index) {
        return widget.itemBuilder(context, index % widget.itemCount);
      },
    );
  }
}
