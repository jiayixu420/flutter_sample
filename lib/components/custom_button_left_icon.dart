import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/colors.dart';

class CustomButtonLeftIcon extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final String text;
  final Color txtColor;
  final Color btnColor;
  final Color iconColor;
  final VoidCallback? onTap;
  final bool withIcon;
  final TextAlign textAlign;
  final double width;
  final double height;
  final Widget? icon;
  final bool hasIcon;

  const CustomButtonLeftIcon({
    Key? key,
    this.margin = EdgeInsets.zero,
    required this.text,
    this.txtColor = Colors.white,
    this.btnColor = blueColor,
    this.onTap,
    this.withIcon = false,
    this.textAlign = TextAlign.left,
    this.width = 263,
    this.height = 54,
    this.icon,
    this.iconColor = cornflowerBlueColor,
    this.hasIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: margin,
        width: width.w,
        height: height.h,
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
            if (hasIcon)
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      bottomLeft: Radius.circular(40.r),
                    ),
                  ),
                  height: height.h,
                  child: Center(child: icon),
                ),
              ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: hasIcon ? 15.w : 0),
                child: CustomText(
                  color: txtColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  textAlign: textAlign,
                  text: text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
