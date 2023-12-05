import 'package:flutter/material.dart';

import 'custom_slider_colors.dart';
import 'custom_slider_widths.dart';
import 'functions.dart';
import 'info_properties.dart';

class CircularSliderAppearance {
  static const double _defaultSize = 150.0;
  static const double _defaultStartAngle = 150.0;
  static const double _defaultAngleRange = 240.0;

  static const Color _defaultInnerTrackColor = Colors.black;
  static const Color _defaultOuterTrackColor = Colors.black;

  String _defaultPercentageModifier(double value) {
    final roundedValue = (value).ceil().toInt().toString();
    return '$roundedValue %';
  }

  final double size;
  final double startAngle;
  final double angleRange;
  final bool animationEnabled;
  final bool spinnerMode;
  final bool counterClockwise;
  final double animDurationMultiplier;
  final int spinnerDuration;
  final CustomSliderWidths? customWidths;
  final CustomSliderColors? customColors;
  final InfoProperties? infoProperties;

  double? get _customInnerTrackWidth => customWidths?.innerTrackWidth;
  double? get _customOuterTrackWidth => customWidths?.outerTrackWidth;
  double? get _customTouchWidth => customWidths?.touchWidth;
  double? get _customHandlerSize => customWidths?.handlerSize;
  double? get _customHandlerWidth => customWidths?.handlerWidth;

  double get innerTrackWidth => _customInnerTrackWidth ?? touchWidth / 4.0;
  double get outerTrackWidth => _customOuterTrackWidth ?? touchWidth / 4.0;
  double get touchWidth => _customTouchWidth ?? size / 10.0;
  double get handlerSize => _customHandlerSize ?? touchWidth / 5.0;
  double get handlerWidth => _customHandlerWidth ?? touchWidth / 5.0;

  Color? get _customInnerTrackColor => customColors?.innerTrackColor;
  Color? get _customOuterTrackColor => customColors?.outerTrackColor;

  Color get innerTrackColor =>
      _customInnerTrackColor ?? _defaultInnerTrackColor;
  Color get outerTrackColor =>
      _customOuterTrackColor ?? _defaultOuterTrackColor;

  String? get _topLabelText => infoProperties?.topLabelText;
  String? get _bottomLabelText => infoProperties?.bottomLabelText;
  TextStyle? get _mainLabelStyle => infoProperties?.mainLabelStyle;
  TextStyle? get _topLabelStyle => infoProperties?.topLabelStyle;
  TextStyle? get _bottomLabelStyle => infoProperties?.bottomLabelStyle;
  PercentageModifier? get _modifier => infoProperties?.modifier;

  PercentageModifier get infoModifier =>
      _modifier ?? _defaultPercentageModifier;
  String? get infoTopLabelText => _topLabelText;
  String? get infoBottomLabelText => _bottomLabelText;
  TextStyle get infoMainLabelStyle {
    return _mainLabelStyle ??
        TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: size / 5.0,
            color: const Color.fromRGBO(30, 0, 59, 1.0));
  }

  TextStyle get infoTopLabelStyle {
    return _topLabelStyle ??
        TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: size / 10.0,
            color: const Color.fromRGBO(147, 81, 120, 1.0));
  }

  TextStyle get infoBottomLabelStyle {
    return _bottomLabelStyle ??
        TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: size / 10.0,
            color: const Color.fromRGBO(147, 81, 120, 1.0));
  }

  const CircularSliderAppearance(
      {this.customWidths,
      this.customColors,
      this.size = _defaultSize,
      this.startAngle = _defaultStartAngle,
      this.angleRange = _defaultAngleRange,
      this.infoProperties,
      this.animationEnabled = true,
      this.counterClockwise = false,
      this.spinnerMode = false,
      this.spinnerDuration = 1500,
      this.animDurationMultiplier = 1.0});
}
