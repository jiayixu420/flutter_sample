import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/controllers/quiz_controller.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'package:happy_nation/models/question.dart';

class SliderComponent extends StatelessWidget {
  final Question question;
  const SliderComponent({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) => Container(
        width: 370.w,
        margin: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 23.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 80.h, left: 20.w, right: 20.w),
              child: CustomText(
                text: question.question!,
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  11,
                  (index) => CustomText(
                    text: '$index',
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Obx(
              () => Slider(
                value: controller.sliderValue.value,
                min: 0.0,
                max: 10.0,
                onChanged: (value) => controller.onSliderChanged(value),
                activeColor: Colors.white,
                inactiveColor: Colors.white,
                thumbColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DrawLayout(
                    imgPath: IconAssets.angryFace,
                    height: 32,
                    width: 32,
                    marginTop: 0,
                  ),
                  DrawLayout(
                    imgPath: IconAssets.neutralFace,
                    height: 32,
                    width: 32,
                    marginTop: 0,
                  ),
                  DrawLayout(
                    imgPath: IconAssets.smilingFace,
                    height: 32,
                    width: 32,
                    marginTop: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
