import 'package:flutter/material.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroComponent extends StatelessWidget {
  final String drawPath;
  final String? text;
  const IntroComponent({Key? key, required this.drawPath, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      alignment: Alignment.center,
      child: Column(
        children: [
          DrawLayout(
            imgPath: drawPath,
            height: 378.59,
            width: 433.98,
            marginTop: 110,
          ),
          // CustomText(
          //   text: AppString.dontGoThrough,
          //   fontSize: 30,
          //   color: Colors.white,
          //   fontWeight: FontWeight.w700,
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: CustomText(
              text: text!,
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          // const CustomText(
          //   text: "Eric Butterworth",
          //   fontWeight: FontWeight.w400,
          //   fontSize: 16,
          //   color: Colors.white,
          // )
        ],
      ),
    );
  }
}
