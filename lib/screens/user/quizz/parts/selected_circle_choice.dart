import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/colors.dart';

class SelectedCircleChoice extends StatelessWidget {
  const SelectedCircleChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.w,
      width: 30.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: turquoiseColor,
      ),
      child: Center(
        child: Icon(
          Icons.check,
          size: 18.w,
          color: Colors.white,
        ),
      ),
    );
  }
}
