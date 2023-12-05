import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';

class CustomAvatar extends StatelessWidget {
  final EdgeInsets margin;
  final double width;
  final double height;
  final String? image;
  final bool hasMedia;
  const CustomAvatar(
      {Key? key,
      this.margin = EdgeInsets.zero,
      this.width = 54,
      this.height = 54,
      this.image,
      this.hasMedia = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.w,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: lightBlueColor2,
          width: 2.r,
        ),
        image: DecorationImage(
          image: hasMedia
              ? CachedNetworkImageProvider(image!)
              : const AssetImage(MainAssets.avatarPng) as ImageProvider,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
