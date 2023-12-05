import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/constants/colors.dart';

class ThumbComponent extends StatelessWidget {
  final String path;
  const ThumbComponent({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      height: 122.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            path,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ceruleanBlueColor.withOpacity(.5),
        ),
        child: Center(
          child: Icon(
            Icons.play_arrow_rounded,
            size: 60.h,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
