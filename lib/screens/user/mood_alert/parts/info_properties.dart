import 'package:flutter/material.dart';

import 'functions.dart';

class InfoProperties {
  final PercentageModifier? modifier;
  final TextStyle? mainLabelStyle;
  final TextStyle? topLabelStyle;
  final TextStyle? bottomLabelStyle;
  final String? topLabelText;
  final String? bottomLabelText;

  InfoProperties(
      {this.topLabelText,
      this.bottomLabelText,
      this.mainLabelStyle,
      this.topLabelStyle,
      this.bottomLabelStyle,
      this.modifier});
}
