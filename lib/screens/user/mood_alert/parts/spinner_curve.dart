import 'package:flutter/material.dart';

class SpinnerCurve extends Curve {
  const SpinnerCurve();

  @override
  double transform(double t) => (t <= 0.5) ? 1.9 * t : 1.85 * (1 - t);
}
