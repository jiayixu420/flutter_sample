import 'package:flutter/material.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/models/answer.dart';
import 'package:happy_nation/screens/user/quizz/parts/circle_choice.dart';
import 'package:happy_nation/screens/user/quizz/parts/circle_number.dart';
import 'package:happy_nation/screens/user/quizz/parts/selected_circle_choice.dart';

class AnswerComponent extends StatelessWidget {
  final Answer answer;
  final int index;
  final VoidCallback onTap;
  final bool selected;
  const AnswerComponent(
      {Key? key,
      required this.answer,
      required this.index,
      required this.onTap,
      required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 19.h,
          left: 40.h,
          right: 40.h,
        ),
        padding: EdgeInsets.only(
          left: 8.h,
          right: 8.h,
          bottom: 10.h,
          top: 10.h,
        ),
        width: 347.w,
        // height: 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: lightBlueColor3,
          border: Border.all(
            color: lightBlueColor2,
            width: 3.sp,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleNumber(
              number: index,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.h),
                child: CustomText(
                  textAlign: TextAlign.left,
                  text: answer.answer!,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            selected ? const SelectedCircleChoice() : const CircleChoice(),
          ],
        ),
      ),
    );
  }
}
