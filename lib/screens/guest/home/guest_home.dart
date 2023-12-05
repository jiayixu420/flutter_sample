import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/guest_home_controller.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuestHome extends StatelessWidget {
  const GuestHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestHomeController>(
      init: GuestHomeController(),
      builder: (controller) => MasterLayout(
        drawLayout: true,
        safeAreaTop: false,
        drawMarginTop: 100,
        drawMarginBottom: 18,
        imgPath: DrawAssets.draw1Svg,
        bottomWidget: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                  left: 24.w,
                  right: 16.w,
                ),
                child: CustomText(
                  color: grayColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  text: ConstantTexts
                      .createTheSpaceForTeamsBoostThemWithAHappyMood.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                  left: 24.w,
                  right: 16.w,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts.simpleFunnyAndQuick.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 24.w,
                  right: 16.w,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts.discoverOurQuizToBeTheBestOfYourself.tr,
                ),
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 36.h),
                text: ConstantTexts.login.tr,
                onTap: () => controller.login(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                ),
                child: CustomText(
                  color: lightBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: ConstantTexts.createANewAccount.tr,
                  onTap: () => controller.register(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
