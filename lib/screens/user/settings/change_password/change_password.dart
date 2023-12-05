import 'package:flutter/material.dart';
import 'package:happy_nation/components/cutom_icon.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/change_password_controller.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/components/custom_text_field.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/helpers/custom_errors.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (controller) => MasterLayout(
        drawLayout: true,
        imgPath: DrawAssets.draw4Svg,
        backgroundImg: MainAssets.background5,
        drawHeight: 188.96,
        drawWidth: 219.26,
        drawMarginTop: 10,
        rectangleHeight: 716,
        hasBackArrow: true,
        onTap: () => Get.back(),
        bottomWidget: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                  text: ConstantTexts.hello.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 21.h,
                  left: 50.w,
                  right: 50.w,
                  bottom: 1.h,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts.weWantToKnowYouMore.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts
                      .youCanStartUsingTheApplicationAfterSignUp.tr,
                ),
              ),
              Form(
                key: controller.changePasswordKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.currentPassword.tr,
                      // initialValue: '123456',
                      textAlign: TextAlign.left,
                      obscureText: true,
                      leftIcon: const CustomIcon(icon: IconAssets.key),
                      onSaved: (value) =>
                          controller.user.value.currentPassword = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.password.tr);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.newPassword.tr,
                      // initialValue: '123456',
                      textAlign: TextAlign.left,
                      obscureText: true,
                      leftIcon: const CustomIcon(icon: IconAssets.key),
                      onSaved: (value) =>
                          controller.user.value.password = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.password.tr);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.confirmYourNewPassword.tr,
                      obscureText: true,
                      // initialValue: '123456',
                      textAlign: TextAlign.left,
                      leftIcon: const CustomIcon(icon: IconAssets.rightKey),
                      onSaved: (value) =>
                          controller.user.value.cPassword = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.password.tr);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                  ],
                ),
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 36.h),
                text: ConstantTexts.change.tr,
                onTap: () => controller.changePassword(),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                margin: EdgeInsets.only(top: 36.h),
                text: ConstantTexts.deleteYourAccount.tr,
                onTap: () => controller.profileController.deleteAccount(),
                btnColor: fireOpalColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
