import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final String? textSpan;
  final double fontSize;
  final Color color;
  final Color spanColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final List<InlineSpan>? children;
  const CustomRichText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.onTap,
    this.children = const [],
    required this.textSpan,
    required this.spanColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: fontSize.h,
            fontWeight: fontWeight,
            color: color,
          ),
          children: [
            TextSpan(
              text: textSpan,
              style: TextStyle(
                fontSize: fontSize.h,
                fontWeight: FontWeight.w400,
                color: spanColor,
              ),
            ),
            ...children!
          ],
        ),
      ),
    );
  }
}
