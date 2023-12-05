import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:happy_nation/components/custom_rich_text.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/texts_en.dart';

class QuizzPercent extends StatelessWidget {
  final String questionNumber;
  final String questionTotal;
  final double percent;
  const QuizzPercent(
      {Key? key,
      required this.questionNumber,
      required this.questionTotal,
      required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 26.h,
        bottom: 43.h,
      ),
      child: Column(
        children: [
          Container(
            width: 347.w,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(bottom: 5.h),
            child: CustomRichText(
              text: '${ConstantTexts.question.tr} $questionNumber',
              fontSize: 18,
              color: lavenderBlueColor,
              textAlign: TextAlign.right,
              fontWeight: FontWeight.w700,
              spanColor: Colors.white,
              textSpan: ' /$questionTotal',
            ),
          ),
          Container(
            width: 347.w,
            height: 42.h,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: lightBlueColor3,
                width: 2.sp,
              ),
            ),
            child: AnimatedContainer(
              width: percent.w,
              height: 42.h,
              margin: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    hex("#00F5A0").withOpacity(1),
                    hex("#00D9F5").withOpacity(1)
                  ],
                ),
              ),
              duration: const Duration(seconds: 1),
            ),
          ),
        ],
      ),
    );
  }
}
