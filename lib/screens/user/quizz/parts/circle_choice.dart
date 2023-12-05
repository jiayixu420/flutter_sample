import 'package:flutter/material.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleChoice extends StatelessWidget {
  const CircleChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.w,
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: lightBlueColor2,
          width: 3.sp,
        ),
      ),
    );
  }
}
