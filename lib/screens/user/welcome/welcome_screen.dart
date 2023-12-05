import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_avatar.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/welcome_controller.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeUserScreen extends StatelessWidget {
  const WelcomeUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeUserController>(
      init: WelcomeUserController(),
      builder: (controller) => MasterLayout(
        drawLayout: true,
        drawHeight: 337,
        drawWidth: 336,
        imgPath: DrawAssets.draw3Svg,
        bottomWidget: SingleChildScrollView(
          child: Column(
            children: [
              CustomAvatar(
                margin: EdgeInsets.only(top: 30.h),
                image: controller.userController.currentUser.image,
                hasMedia: controller.userController.currentUser.hasMedia!,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.h,
                  left: 24.w,
                  right: 16.w,
                ),
                child: CustomText(
                  color: grayColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  text:
                      '${ConstantTexts.welcome.tr} ${controller.userController.currentUser.firstName},',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 21.h,
                  left: 24.w,
                  right: 16.w,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts.itTakes2MnToMeasureYourHappiness.tr,
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
                  text: ConstantTexts.youCanNowAccessAllQuiz.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.h,
                  left: 62.w,
                  right: 62.w,
                ),
                child: SvgPicture.asset(
                  IconAssets.arrowDowngrade,
                  width: 10.w,
                  height: 16.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.h,
                  left: 62.w,
                  right: 62.w,
                ),
                child: CustomText(
                  color: grayColor,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  text: ConstantTexts.readyToBoostYourHappinessHereWeAre.tr,
                ),
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 36.h, bottom: 95.h),
                text: ConstantTexts.startYourQuiz.tr,
                onTap: () => controller.homeQuiz(),
                // btnColor: yellowColor,
                // txtColor: fieldDrabColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
