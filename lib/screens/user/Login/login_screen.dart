import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/components/custom_text_field.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/login_controller.dart';
import 'package:happy_nation/helpers/custom_errors.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => MasterLayout(
        drawLayout: true,
        safeAreaTop: false,
        drawMarginTop: controller.drawMarginTop.value,
        drawMarginBottom: 19,
        imgPath: DrawAssets.draw2Svg,
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
                  text: ConstantTexts.welcomeBack.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 21.h,
                  left: 24.w,
                  right: 16.w,
                  bottom: 21.h,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts.pleaseLoginToYourAccount.tr,
                ),
              ),
              Form(
                key: controller.loginKey,
                child: Column(
                  children: [
                    CustomTextField(
                      placeholder: ConstantTexts.emailOrMobileNumber.tr,
                      textAlign: TextAlign.left,
                      // initialValue: 'test@test.com',
                      onSaved: (value) => controller.user.value.email = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(
                              ConstantTexts.emailOrMobileNumber.tr);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.password.tr,
                      // initialValue: '123456',
                      obscureText: controller.isObscrure.value,
                      textAlign: TextAlign.left,
                      rightIcon: InkWell(
                        onTap: () => controller.togglePasswordVisibility(),
                        child: Icon(
                          controller.isObscrure.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 20.h,
                          color: lightGrayColor,
                        ),
                      ),
                      onSaved: (value) =>
                          controller.user.value.password = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.password.tr);
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 21.h,
                          right: 50.w,
                        ),
                        child: CustomText(
                          color: lightBlueColor,
                          textAlign: TextAlign.right,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          text: ConstantTexts.forgotPassword.tr,
                          onTap: () => controller.forgetPassword(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 21.h),
                text: ConstantTexts.signIn.tr,
                onTap: () => controller.login(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                ),
                child: CustomText(
                  color: grayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: ConstantTexts.dontHaveAnAccount.tr,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.h,
                  bottom: 36.h,
                ),
                child: CustomText(
                  color: lightBlueColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: ConstantTexts.createANewOne.tr,
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
