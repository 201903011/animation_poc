import 'package:flutter/material.dart';

class ConcaveCircularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final Path path = Path();

    // Draw the concave part
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.arcToPoint(
      Offset(size.width * 0.5, size.height),
      radius: Radius.circular(8),
      clockwise: false,
    );
    path.arcToPoint(
      Offset(0, size.height * 0.5),
      radius: Radius.circular(8),
      clockwise: false,
    );

    // Draw the circular part
    path.lineTo(size.width * 0.5, size.height);
    path.addOval(Rect.fromLTWH(
        size.width * 0.5, 0, size.width * 0.5, size.height * 0.5));

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
