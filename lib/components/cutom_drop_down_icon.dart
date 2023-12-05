import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';

class CustomDropDownIcon extends StatelessWidget {
  const CustomDropDownIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 5.r, vertical: 0.r),
      height: 50.r,
      width: 50.r,
      child: SvgPicture.asset(IconAssets.arrowDown),
    );
  }
}
