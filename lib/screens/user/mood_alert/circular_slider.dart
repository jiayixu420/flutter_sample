import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';

import 'parts/utils.dart';

double radius = 135;
double strokeWidth = 8;

class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;

  const CircularSlider({
    Key? key,
    required this.onAngleChanged,
  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;

  double currentAngle = .2;
  double addAngle = 1;

  double startAngle = toRadian(180);

  double totalAngle = toRadian(180);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(center - Offset(strokeWidth, strokeWidth),
        currentAngle + startAngle, radius);

    return Material(
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 360.0,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: canvasSize,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('eeeee'),
                      ),
                      painter: SliderPainter(
                        startAngle: startAngle,
                        currentAngle: currentAngle,
                      ),
                    ),
                    Positioned(
                      left: knobPos.dx,
                      top: knobPos.dy,
                      child: GestureDetector(
                        onPanStart: (details) {
                          RenderBox getBox =
                              context.findRenderObject() as RenderBox;
                          _currentDragOffset =
                              getBox.globalToLocal(details.globalPosition);
                        },
                        onPanUpdate: (details) {
                          var previousOffset = _currentDragOffset;
                          _currentDragOffset += details.delta;
                          var angle = currentAngle +
                              toAngle(_currentDragOffset, center) -
                              toAngle(previousOffset, center);
                          if (normalizeAngle(angle) >= 3) return;
                          currentAngle = normalizeAngle(angle);
                          widget.onAngleChanged(currentAngle);
                          setState(() {});
                        },
                        child: const _Knob(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter({required this.startAngle, required this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..shader = SweepGradient(colors: colors).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      math.pi,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = const Color(0xffD1D1D0)
        ..strokeWidth = strokeWidth,
    );

    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Knob extends StatelessWidget {
  const _Knob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(IconAssets.smileIcon),
    );
  }
}
