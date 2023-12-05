import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/mood_controller.dart';

import 'gradient_slider.dart';

class ChoseMoodPart extends StatelessWidget {
  const ChoseMoodPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoodController>(
      init: MoodController(),
      builder: (controller) => Column(
        children: [
          Container(
            height: 151.h,
            width: 151.w,
            alignment: Alignment.center,
            child: SvgPicture.asset(MainAssets.moodLogoSvg),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 2.w),
            child: CustomText(
              color: grayColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              text: ConstantTexts.whatsYourMoodToday.tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(IconAssets.sadIcon),
                SvgPicture.asset(IconAssets.neutreIcon),
                SvgPicture.asset(IconAssets.happyIcon),
              ],
            ),
          ),
          Obx(
            () => SliderTheme(
              data: SliderThemeData(
                trackHeight: 8.h,
                inactiveTrackColor: Colors.grey.shade300,
                activeTrackColor: const Color(0xffD1D1D0),
                thumbShape: controller.currentIcon.value,
                thumbColor: Colors.white,
                trackShape: GradientRectSliderTrackShape(
                  gradient: controller.gradient,
                  darkenInactive: false,
                ),
                inactiveTickMarkColor: const Color(0xffEEEEEE),
              ),
              child: Slider(
                value: controller.sliderValue.value,
                min: 1,
                max: 3,
                divisions: 2,
                onChanged: controller.onChanged,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: controller.onConfirm,
            child: SvgPicture.asset(
              IconAssets.checkIcon,
              height: 48.sp,
              width: 48.sp,
            ),
          ),
        ],
      ),
    );
  }
}
