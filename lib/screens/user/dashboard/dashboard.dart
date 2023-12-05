import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:happy_nation/components/custom_button_left_icon.dart';
import 'package:happy_nation/components/custom_drawer.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/screens/user/dashboard/parts/slider_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) => CustomDrawer(
        zoomDrawerController: controller.zoomDrawerController,
        mainScreen: MasterLayout(
          appBar: true,
          drawLayout: true,
          safeAreaTop: controller.isAndroid,
          imgPath: DrawAssets.draw9Svg,
          backgroundImg: MainAssets.background,
          drawHeight: 183.96,
          drawWidth: 500.26,
          drawMarginTop: 2,
          rectangleHeight: 646,
          onTapMenu: () => controller.toggleDrawer(),
          bottomWidget: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 150.h,
                  padding: EdgeInsets.only(
                    top: 40.h,
                    left: 30.w,
                    right: 30.w,
                  ),
                  child: Obx(
                    () => CustomText(
                      color: grayColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      text: (controller.sliderImage.value.id == 2 &&
                              controller.canAnswer.value)
                          ? controller.sliderImage.value.description2!
                          : controller.sliderImage.value.description!,
                    ),
                  ),
                ),
                const DrawLayout(
                  imgPath: IconAssets.handScroll,
                  height: 32,
                  width: 62,
                  marginTop: 0,
                  marginBottom: 6,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 2.h,
                    left: 50.w,
                    right: 50.w,
                    bottom: 1.h,
                  ),
                  child: CustomText(
                    color: lightPeriwinkleColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    text: ConstantTexts.scrolleLeftOrRightToNavigate.tr,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 147.74.w,
                  // margin: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const SliderWidget(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 29.h, bottom: 40.h),
                  height: 9,
                  width: 180,
                  decoration: BoxDecoration(
                    color: hex('#000000').withOpacity(0),
                    borderRadius: BorderRadius.circular(
                      50.r,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: hex('#000000').withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 15.r,
                      ),
                    ],
                  ),
                ),
                CustomButtonLeftIcon(
                  margin: EdgeInsets.only(bottom: 20.h),
                  text: controller.sliderImage.value.btnTxt!,
                  onTap: () => controller.onTap(),
                  iconColor: cornflowerBlueColor,
                  btnColor: (controller.sliderImage.value.id == 2 &&
                          !controller.canAnswer.value)
                      ? americanSilverColor
                      : blueColor,
                  txtColor: (controller.sliderImage.value.id == 2 &&
                          !controller.canAnswer.value)
                      ? grulloColor
                      : Colors.white,
                  hasIcon: controller.sliderImage.value.icon != null,
                  textAlign: controller.sliderImage.value.icon == null
                      ? TextAlign.center
                      : TextAlign.left,
                  width: controller.sliderImage.value.icon == null
                      ? 219
                      : controller.sliderImage.value.id == 0
                          ? 268
                          : 250,
                  icon: controller.sliderImage.value.icon != null
                      ? Container(
                          margin: EdgeInsets.all(10.h),
                          child: Icon(
                            controller.sliderImage.value.icon,
                            size: controller.sliderImage.value.width!.h,
                            color: Colors.white,
                          ),
                        )
                      : const SizedBox(height: 0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
