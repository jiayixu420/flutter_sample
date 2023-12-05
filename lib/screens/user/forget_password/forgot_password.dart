import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/components/custom_text_field.dart';
import 'package:happy_nation/components/cutom_icon.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/forget_password_controller.dart';
import 'package:happy_nation/helpers/custom_errors.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      init: ForgotPasswordController(),
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
                  text: ConstantTexts.hello.tr,
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
                key: controller.forgetPassKey,
                child: Column(
                  children: [
                    CustomTextField(
                      placeholder: ConstantTexts.emailAddress.tr,
                      textAlign: TextAlign.left,
                      // initialValue: 'yakoubetarkaoui@gmail.com',
                      onSaved: (value) => controller.user.value.email = value,
                      leftIcon: const CustomIcon(icon: IconAssets.mail),
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.emailAddress.tr);
                        } else if (!GetUtils.isEmail(input)) {
                          return 'Invalid ${ConstantTexts.emailAddress.tr} !';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Visibility(
                      visible: controller.codeVisiblity.value,
                      child: CustomTextField(
                        placeholder: ConstantTexts.insertCodeSentToYourEmail.tr,
                        textAlign: TextAlign.left,
                        onSaved: (value) =>
                            controller.user.value.resetPassCode = value,
                        leftIcon: const CustomIcon(icon: IconAssets.payCode),
                        validator: (input) {
                          if (input!.isEmpty) {
                            return errorMessage(ConstantTexts.code.tr);
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                  ],
                ),
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 21.h),
                text: ConstantTexts.send.tr,
                onTap: () => controller.resetPasswordSteps(),
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
