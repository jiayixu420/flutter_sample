import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/models/mood.dart';

class MoodCard extends StatelessWidget {
  final Mood? mood;
  const MoodCard({Key? key, this.mood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(mood!.imgPath!),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 2.w),
            child: CustomText(
              color: grayColor,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              text: mood!.mood!.tr,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2.w),
            child: CustomText(
              color: grayColor,
              fontSize: 14,
              fontWeight: FontWeight.w900,
              text: mood!.text!.tr,
            ),
          ),
          SizedBox(height: 42.h)
        ],
      ),
    );
  }
}
