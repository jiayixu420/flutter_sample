import 'package:flutter/material.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoteComponent extends StatelessWidget {
  final double width;
  final bool select;
  const DoteComponent({Key? key, this.width = 7, this.select = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 65.h, right: 4.2.w),
      height: 7.h,
      width: width.w,
      decoration: BoxDecoration(
        color: select ? paleCornflowerBlueColor : lightBlueColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
