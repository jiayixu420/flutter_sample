import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';

class CircleSelectedImage extends StatelessWidget {
  final double width;
  final double height;
  final File? file;
  final VoidCallback? onTap;
  const CircleSelectedImage({
    Key? key,
    this.width = 45,
    this.height = 42,
    this.file,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16.h),
        width: 79.h,
        height: 79.h,
        decoration: BoxDecoration(
          color: brightGrayColor,
          borderRadius: BorderRadius.circular(55.h),
          image: DecorationImage(
            image: file != null
                ? FileImage(file!)
                : const AssetImage(MainAssets.registerAvatarPng)
                    as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
