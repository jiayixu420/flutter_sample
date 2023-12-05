import 'package:flutter/material.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MasterClassesLoader extends StatelessWidget {
  const MasterClassesLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.dotsTriangle(
        color: blueColor,
        size: 120.h,
      ),
    );
  }
}
