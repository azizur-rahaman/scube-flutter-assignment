import 'package:flutter/material.dart';

class GradientScrollbar extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Gradient gradient;
  final double thickness;
  final Radius radius;
  final EdgeInsetsGeometry padding;

  const GradientScrollbar({
    super.key,
    required this.child,
    required this.controller,
    required this.gradient,
    this.thickness = 4.0,
    this.radius = const Radius.circular(4.0),
    this.padding = EdgeInsets.zero,
  });

  @override
  State<GradientScrollbar> createState() => _GradientScrollbarState();
}

class _GradientScrollbarState extends State<GradientScrollbar> {
  double _thumbHeight = 0.0;
  double _thumbOffset = 0.0;
  bool _showThumb = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateScroll);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateScroll);
    super.dispose();
  }

  void _updateScroll() {
    if (!widget.controller.hasClients) return;

    final position = widget.controller.position;
    final maxScrollExtent = position.maxScrollExtent;
    final viewportDimension = position.viewportDimension;

    // If content fits in viewport, hide scrollbar
    if (maxScrollExtent <= 0) {
      if (_showThumb) setState(() => _showThumb = false);
      return;
    }

    final contentSize = maxScrollExtent + viewportDimension;
    // Calculate thumb height as a proportion of the viewport
    // Minimum thumb height of 20 to remain clickable/visible
    final height = (viewportDimension / contentSize) * viewportDimension;
    final thumbHeight = height < 20.0 ? 20.0 : height;

    // Calculate offset
    // The available scrollable area for the thumb is viewport - thumbHeight
    final scrollableArea = viewportDimension - thumbHeight;
    final scrollFraction = position.pixels / maxScrollExtent;

    // Clamp offset to keep within bounds
    final offset = (scrollFraction * scrollableArea).clamp(0.0, scrollableArea);

    if (mounted) {
      setState(() {
        _thumbHeight = thumbHeight;
        _thumbOffset = offset;
        _showThumb = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initial update in case layout is ready
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScroll());

    return Stack(
      children: [
        widget.child,
        if (_showThumb)
          Positioned(
            top: _thumbOffset,
            right: 0,
            child: Container(
              margin: widget.padding,
              width: widget.thickness,
              height: _thumbHeight,
              decoration: BoxDecoration(
                gradient: widget.gradient,
                borderRadius: BorderRadius.all(widget.radius),
              ),
            ),
          ),
      ],
    );
  }
}
