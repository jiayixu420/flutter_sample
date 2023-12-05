import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/controllers/random_icon_controller.dart';
import 'package:happy_nation/models/random_icons.dart';

class RandomIconWidget extends StatelessWidget {
  final RandomIcons randomIcons;

  const RandomIconWidget({Key? key, required this.randomIcons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RandomIconController>(
      init: RandomIconController(),
      global: false,
      builder: (controller) => Positioned(
        top: randomIcons.top!.h - controller.top.value,
        right: randomIcons.right?.h,
        child: Opacity(
          opacity: controller.opacity.value,
          child: SizedBox(
            height: 34.r,
            width: 34.r,
            child: Image.asset(randomIcons.iconPath),
          ),
        ),
      ),
    );
  }
}
