import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/components/custom_app_bar.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/layouts/back_arrow.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'rectangle.dart';

class MasterLayout extends StatelessWidget {
  final String? imgPath;
  final Widget bottomWidget;
  final double drawHeight;
  final double drawWidth;
  final double drawMarginTop;
  final double drawMarginBottom;
  final bool drawLayout;
  final bool appBar;
  final bool hasBackArrow;
  final bool safeAreaTop;
  final String? backgroundImg;
  final VoidCallback? onTap;
  final VoidCallback? onTapMenu;

  final double rectangleHeight;
  const MasterLayout({
    Key? key,
    this.imgPath,
    required this.bottomWidget,
    this.drawHeight = 318,
    this.drawWidth = 369,
    this.drawMarginTop = 100,
    this.drawMarginBottom = 0,
    this.rectangleHeight = 454,
    this.appBar = false,
    this.drawLayout = false,
    this.hasBackArrow = false,
    this.backgroundImg = MainAssets.background4,
    this.onTap,
    this.onTapMenu,
    this.safeAreaTop = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(backgroundImg!),
          ),
        ),
        child: SafeArea(
          bottom: false,
          // top: safeAreaTop,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (appBar)
                DelayedDisplay(
                  delay: const Duration(milliseconds: 50),
                  child: CustomAppBar(
                    onTap: onTapMenu,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                  ),
                ),
              if (drawLayout)
                DelayedDisplay(
                  delay: const Duration(milliseconds: 100),
                  child: SizedBox(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Center(
                          child: DrawLayout(
                            imgPath: imgPath,
                            height: drawHeight,
                            width: drawWidth,
                            marginTop: drawMarginTop,
                            marginBottom: drawMarginBottom,
                          ),
                        ),
                        if (hasBackArrow) BackArrow(onTap: onTap)
                      ],
                    ),
                  ),
                ),
              Expanded(
                child: DelayedDisplay(
                  delay: const Duration(milliseconds: 200),
                  child: RectangleLayout(
                    widget: bottomWidget,
                    height: rectangleHeight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
