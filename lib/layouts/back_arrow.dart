import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/layouts/draw.dart';

class BackArrow extends StatelessWidget {
  final VoidCallback? onTap;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  const BackArrow({
    Key? key,
    this.onTap,
    this.top,
    this.right,
    this.bottom = 24,
    this.left = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left?.w,
      bottom: bottom?.h,
      right: right?.w,
      top: top?.h,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 44.h,
          height: 44.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: hex('#000000').withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
              child: DrawLayout(
            imgPath: IconAssets.backArrow,
            height: 12.h,
            width: 18.w,
            marginTop: 0,
          )),
        ),
      ),
    );
  }
}
