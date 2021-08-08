import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  final PaintingStyle paintingStyle;

  TrianglePainter({required this.color, required this.paintingStyle});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x / 2, y)
      ..lineTo(x, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.paintingStyle != paintingStyle;
  }
}
