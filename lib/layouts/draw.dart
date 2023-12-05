import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawLayout extends StatelessWidget {
  final String? imgPath;
  final double? height;
  final double? width;
  final double? marginTop;
  final double? marginBottom;
  final GestureTapCallback? onTap;
  const DrawLayout({
    Key? key,
    this.imgPath,
    this.height,
    this.width,
    this.marginTop,
    this.marginBottom = 0,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("height: " + height!.r.toString());
    print("width: " + width!.r.toString());
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(
        top: marginTop!.w,
        // top: marginTop!.w * .65,
        bottom: marginBottom!.w,
      ),
      width: width!.r,
      height: height!.r,
      child: GestureDetector(
        child: SvgPicture.asset(
          imgPath!,
          fit: BoxFit.contain,
        ),
        onTap: onTap,
      ),
    );
  }
}
