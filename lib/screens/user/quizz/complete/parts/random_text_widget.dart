import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/pill_component.dart';
import 'package:happy_nation/controllers/random_text_controller.dart';
import 'package:happy_nation/models/positive_word.dart';

class RandomTextWidget extends StatelessWidget {
  final PositiveWord positiveWord;

  const RandomTextWidget({Key? key, required this.positiveWord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RandomTextController>(
      init: RandomTextController(),
      global: false,
      builder: (controller) => Positioned(
        top: positiveWord.top?.h,
        right: positiveWord.right?.h,
        child: Opacity(
          opacity: controller.opacity.value,
          child: PillConponent(
            text: positiveWord.text,
            icon: positiveWord.iconPath,
          ),
        ),
      ),
    );
  }
}
