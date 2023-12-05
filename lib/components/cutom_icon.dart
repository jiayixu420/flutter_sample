import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String icon;
  const CustomIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.r,
      width: 42.r,
      margin: EdgeInsets.only(
        top: 7.h,
        left: 7.h,
        right: 7.h,
        bottom: 7.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Container(
        width: 19.h,
        height: 19.h,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}
