import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class CircleWidget extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  const CircleWidget({
    Key? key,
    this.color = circleWidgetColor,
    this.strokeWidth = widgetStrokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclePainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
