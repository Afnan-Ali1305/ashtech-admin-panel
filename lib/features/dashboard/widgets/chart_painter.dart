import 'package:flutter/material.dart';

class ChartPainter extends CustomPainter {
  final ColorScheme colorScheme;

  ChartPainter({required this.colorScheme});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = const Color(0xFFE07A5F)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.cubicTo(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.3,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.3,
    );
    path.cubicTo(
      size.width * 0.7,
      size.height * 0.5,
      size.width * 0.8,
      size.height * 0.4,
      size.width,
      size.height * 0.1,
    );

    // Gradient fill under the line
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFE07A5F).withAlpha(100),
          const Color(0xFFE07A5F).withAlpha(0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
