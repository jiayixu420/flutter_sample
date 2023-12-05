import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String text;
  final Color txtColor;
  final Color btnColor;
  final VoidCallback? onTap;
  final bool withIcon;
  final TextAlign textAlign;
  const CustomButton({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.text,
    this.txtColor = Colors.white,
    this.btnColor = blueColor,
    this.onTap,
    this.withIcon = false,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: 219.w,
        height: 54.h,
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
            Expanded(
              flex: 3,
              child: CustomText(
                color: txtColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                textAlign: textAlign,
                text: text,
              ),
            ),
            if (withIcon)
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  IconAssets.arrowRight,
                  width: 16.w,
                  height: 10.w,
                ),
              )
          ],
        ),
      ),
    );
  }
}
