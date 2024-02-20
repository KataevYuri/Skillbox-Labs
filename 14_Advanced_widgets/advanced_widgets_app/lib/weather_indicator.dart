import 'package:flutter/material.dart';

class WeatherIndicator extends CustomPainter {
  WeatherIndicator({
    required this.wheatherState,
  }) {
    sunOpacity = wheatherState;
    rainOpacity = 1 - wheatherState;
  }

  final double wheatherState;
  double sunOpacity = 0;
  double rainOpacity = 0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey;
    //canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    paint.color = Colors.yellow.withOpacity(wheatherState);
    canvas.drawCircle(const Offset(60, 50), 50, paint);

    paint.color = Colors.black.withOpacity(rainOpacity);

    canvas.drawCircle(const Offset(50, 80), 30, paint);
    canvas.drawCircle(const Offset(90, 70), 30, paint);
    canvas.drawCircle(const Offset(130, 80), 30, paint);
    canvas.drawOval(
        Rect.fromPoints(const Offset(10, 60), const Offset(170, 110)), paint);

    paint.color = Colors.blue.withOpacity(rainOpacity);

    canvas.drawCircle(const Offset(50, 120), 4, paint);
    canvas.drawCircle(const Offset(80, 120), 4, paint);
    canvas.drawCircle(const Offset(120, 120), 4, paint);
    canvas.drawCircle(const Offset(40, 140), 4, paint);
    canvas.drawCircle(const Offset(70, 140), 4, paint);
    canvas.drawCircle(const Offset(100, 140), 4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
