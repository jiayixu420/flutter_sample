import 'package:division/division.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/controllers/mood_controller.dart';
import 'package:happy_nation/screens/user/mood_alert/parts/chose_mood_part.dart';

import 'parts/cards/mood_card.dart';

class MoodSliderScreen extends StatefulWidget {
  const MoodSliderScreen({Key? key}) : super(key: key);

  @override
  _MoodSliderScreenState createState() => _MoodSliderScreenState();
}

class _MoodSliderScreenState extends State<MoodSliderScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoodController>(
      init: MoodController(),
      builder: (controller) => Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50.w),
            child: Center(
              child: Container(
                height: 460.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Material(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 10.sp,
                            ),
                            width: 27.h,
                            height: 27.h,
                            child: Icon(
                              Icons.close_rounded,
                              size: 35.sp,
                              color: hex('CAD2DC'),
                            ),
                          ),
                        ),
                      ),
                      !controller.toMoodResult.value
                          ? const ChoseMoodPart()
                          : Expanded(
                              child: MoodCard(mood: controller.moodModel.value))
                    ],
                  ),
                ),
              ),
            ),
          ),
          ...controller.randomIconsWidgets,
        ],
      ),
    );
  }
}
