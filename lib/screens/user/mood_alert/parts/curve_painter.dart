import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'circular_slider_appearance.dart';
import 'functions.dart';

class CurvePainter extends CustomPainter {
  final double angle;
  final CircularSliderAppearance appearance;
  final double startAngle;
  final double angleRange;

  Offset? handler;
  Offset? center;
  late double radius;

  CurvePainter(
      {required this.appearance,
      this.angle = 30,
      required this.startAngle,
      required this.angleRange});

  @override
  void paint(Canvas canvas, Size size) {
    radius =
        math.min(size.width / 2, size.height / 2) - appearance.touchWidth * 0.5;
    center = Offset(size.width / 2, size.height / 2);

    final trackPaint = Paint()..style = PaintingStyle.stroke;

    trackPaint.color = appearance.outerTrackColor;
    trackPaint.strokeWidth = appearance.outerTrackWidth;
    drawCircularArc(
        canvas: canvas,
        size: Size(size.width, size.height),
        paint: trackPaint,
        radius: radius +
            appearance.innerTrackWidth / 2 +
            appearance.outerTrackWidth / 2,
        ignoreAngle: true,
        spinnerMode: appearance.spinnerMode);

    trackPaint.color = appearance.innerTrackColor;
    trackPaint.strokeWidth = appearance.innerTrackWidth;
    drawCircularArc(
        canvas: canvas,
        size: size,
        paint: trackPaint,
        radius: radius,
        ignoreAngle: true,
        spinnerMode: appearance.spinnerMode);

    final currentAngle = appearance.counterClockwise ? -angle : angle;

    var dividersPaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 1.5;

    for (final angle in [0, 18, 36, 54, 72, 108, 126, 144, 162, 180]) {
      Offset handler = degreesToCoordinates(center!, -math.pi / 2 + angle + 1.5,
          radius - appearance.innerTrackWidth / 2 + 2);
      Offset handler2 = degreesToCoordinates(
          center!,
          -math.pi / 2 + angle + 1.5,
          radius + appearance.innerTrackWidth / 2 - 2);
      canvas.drawLine(handler, handler2, dividersPaint);
    }

    var dotPaint = Paint();

    Offset dotHandler =
        degreesToCoordinates(center!, -math.pi / 2 + 90 + 1.5, radius);
    dotPaint.shader = ui.Gradient.radial(
      dotHandler,
      appearance.innerTrackWidth / 3,
      [
        const Color(0xfff963b5),
        const Color(0xfffe94cd),
      ],
    );
    // canvas.drawCircle(dotHandler, appearance.innerTrackWidth / 3, dotPaint);

    Offset handler = degreesToCoordinates(
        center!, -math.pi / 2 + startAngle + currentAngle + 1.5, radius);
    Offset handler2 = degreesToCoordinates(
      center!,
      -math.pi / 2 + startAngle + currentAngle + 1.5,
      radius + appearance.handlerWidth,
    );

    var handlerPaint = Paint()
      ..shader = ui.Gradient.linear(
        handler,
        handler2,
        [
          const Color(0xfffbf9fa),
          const Color(0xffff7ba3),
        ],
      );

    final fishCodePoint = Icons.access_alarm.codePoint;

    TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
    textPainter.text = TextSpan(
      text: String.fromCharCode(fishCodePoint),
    );

    final path = Path()
      ..moveTo(handler2.dx, handler2.dy)
      ..arcTo(
          Rect.fromCenter(
              center: handler2,
              width: appearance.handlerSize,
              height: appearance.handlerSize),
          degreeToRadians(currentAngle) + math.pi / 2 - math.pi / 4,
          math.pi + math.pi / 2,
          true)
      ..lineTo(handler.dx, handler.dy)
      ..close();

    canvas.drawPath(path, handlerPaint);
  }

  drawCircularArc(
      {required Canvas canvas,
      required Size size,
      required Paint paint,
      required double radius,
      bool ignoreAngle = false,
      bool spinnerMode = false}) {
    final double angleValue = ignoreAngle ? 0 : (angleRange - angle);
    final range = appearance.counterClockwise ? -angleRange : angleRange;
    final currentAngle = appearance.counterClockwise ? angleValue : -angleValue;
    canvas.drawArc(
        Rect.fromCircle(center: center!, radius: radius),
        degreeToRadians(spinnerMode ? 0 : startAngle),
        degreeToRadians(spinnerMode ? 360 : range + currentAngle),
        false,
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
