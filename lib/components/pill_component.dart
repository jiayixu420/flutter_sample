import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/colors.dart';

class PillConponent extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String text;
  final Color txtColor;
  final Color btnColor;
  final TextAlign textAlign;
  final double? width;
  final double height;
  final String? icon;

  const PillConponent({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.text,
    this.txtColor = Colors.white,
    this.btnColor = blueColor,
    this.textAlign = TextAlign.left,
    this.width,
    this.height = 36,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.only(
        right: 16.w,
        left: 8.w,
        top: 8.h,
        bottom: 8.h,
      ),
      width: width?.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: btnColor,
        borderRadius: BorderRadius.circular(
          40.r,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 22.h,
            width: 22.h,
            child: SvgPicture.asset(icon!),
          ),
          Container(
            margin: EdgeInsets.only(left: 8.w),
            child: CustomText(
              color: txtColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              textAlign: textAlign,
              text: text,
            ),
          ),
        ],
      ),
    );
  }
}
