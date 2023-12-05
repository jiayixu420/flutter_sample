import 'dart:math' as math;

import 'package:flutter/material.dart';

List<Color> colors = [
  const Color(0xffF14D4D),
  const Color(0xffFF9E45),
  const Color(0xff56E449),
];

const fullAngleInRadians = math.pi;

double normalizeAngle(double angle) => normalize(angle, fullAngleInRadians);

Offset toPolar(Offset center, double radians, double radius) =>
    center + Offset.fromDirection(radians, radius);

double normalize(double value, double max) => (value % max + max) % max;

double toAngle(Offset position, Offset center) => (position - center).direction;

double toRadian(double value) => (value * math.pi) / 180;
