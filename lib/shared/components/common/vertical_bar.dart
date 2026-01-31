import 'package:flutter/material.dart';

/// Reusable vertical bar component for cards
/// Displays a colored vertical bar, typically used as a leading indicator
class VerticalBar extends StatelessWidget {
  /// Color of the vertical bar
  final Color color;
  
  /// Width of the vertical bar (default: 4)
  final double width;

  const VerticalBar({
    super.key,
    required this.color,
    this.width = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: color,
    );
  }
}

