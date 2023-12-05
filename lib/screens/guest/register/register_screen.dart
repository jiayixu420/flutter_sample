import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:happy_nation/components/custom_drop_down.dart';
import 'package:happy_nation/components/cutom_icon.dart';
import 'package:happy_nation/components/html_compenent.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/html/terms.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/components/custom_text_field.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/helpers/custom_errors.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/screens/guest/register/parts/circle_selected_image.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) => MasterLayout(
        drawLayout: true,
        imgPath: DrawAssets.draw4Svg,
        backgroundImg: MainAssets.background5,
        drawHeight: 188.96,
        drawWidth: 219.26,
        drawMarginTop: 2,
        rectangleHeight: 716,
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
              Form(
                key: controller.registerKey,
                child: Column(
                  children: [
                    Obx(
                      () => CircleSelectedImage(
                        onTap: () => controller.getTaskImage(),
                        file: controller.imgSelected.value
                            ? controller.userImg
                            : null,
                      ),
                    ),
                    CustomDropDown(
                      leftIcon: const CustomIcon(icon: IconAssets.gender),
                      placeholder: ConstantTexts.gender.tr,
                      controller: controller.genderController.value,
                      items: <String>[
                        ConstantTexts.male.tr,
                        ConstantTexts.female.tr
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) =>
                          controller.onGenderChange(value!),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.fullName.tr + "*",
                      // initialValue: 'Yakoub Tarkaoui',
                      textAlign: TextAlign.left,
                      leftIcon: const CustomIcon(icon: IconAssets.userBusiness),
                      onSaved: (value) => controller.user.value.name = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.fullName.tr);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.age.tr,
                      // initialValue: 'Yakoub Tarkaoui',
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      leftIcon: const CustomIcon(icon: IconAssets.userAge),
                      onSaved: (value) => controller.user.value.age = value,
                      validator: (input) {
                        // if (input!.isEmpty) {
                        //   return errorMessage(ConstantTexts.age.tr);
                        // } else if (int.parse(input) > 100 ||
                        //     int.parse(input) < 16) {
                        //   return 'Invalid ${ConstantTexts.age.tr}';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomDropDown(
                      leftIcon: const CustomIcon(icon: IconAssets.function),
                      placeholder: ConstantTexts.function.tr + "*",
                      controller: controller.functionController.value,
                      items: <String>[
                        ConstantTexts.manager.tr,
                        ConstantTexts.employee.tr
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) =>
                          controller.onFunctionChange(value!),
                    ),
                    Obx(
                      () => controller.functionFieldValidation.value
                          ? const SizedBox()
                          : Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(
                                top: 4.h,
                                left: 15.w,
                                bottom: 1.h,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 38.w),
                              child: CustomText(
                                color: fireOpalColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                text: errorMessage(ConstantTexts.function.tr),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      controller: controller.cityController.value,
                      placeholder: ConstantTexts.city.tr,
                      textAlign: TextAlign.left,
                      leftIcon: const CustomIcon(icon: IconAssets.city),
                      onSaved: (value) => controller.user.value.city = value,
                      validator: (input) {
                        // if (input!.isEmpty) {
                        //   return errorMessage(ConstantTexts.city.tr);
                        // }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.emailAddress.tr + "*",
                      keyboardType: TextInputType.emailAddress,
                      // initialValue: 'yakoubetarkaoui2@gmail.com',
                      textAlign: TextAlign.left,
                      leftIcon: const CustomIcon(icon: IconAssets.mail),
                      onSaved: (value) => controller.user.value.email = value,
                      validator: (input) {
                        if (input!.isEmpty || !GetUtils.isEmail(input)) {
                          return errorMessage(ConstantTexts.emailAddress.tr);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.phoneNumber.tr + "*",
                      initialValue: '+212',
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.left,
                      leftIcon: const CustomIcon(icon: IconAssets.phone),
                      onSaved: (value) => controller.user.value.phone = value,
                      validator: (input) {
                        if (input!.isEmpty) {
                          return errorMessage(ConstantTexts.phoneNumber.tr);
                        } else if (!Helper.regExp.hasMatch(input)) {
                          return 'Invalid ${ConstantTexts.phoneNumber.tr}';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    CustomTextField(
                      placeholder: ConstantTexts.password.tr + "*",
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
                      placeholder: ConstantTexts.confirmYourPassword.tr + "*",
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
                    CustomTextField(
                      placeholder: ConstantTexts.accessCode.tr,
                      // initialValue: '15f7353021',
                      leftIcon: const CustomIcon(icon: IconAssets.payCode),
                      textAlign: TextAlign.left,
                      onSaved: (value) =>
                          controller.user.value.company!.code = value,
                      validator: (input) {
                        // if (input!.isEmpty) {
                        //   return errorMessage(ConstantTexts.accessCode.tr);
                        // }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Parent(
                style: ParentStyle()..maxWidth(270.h),
                child: Row(
                  children: [
                    Switch(
                      value: controller.isAgree.value,
                      onChanged: (state) => controller.setArgument(state),
                      activeColor: Colors.white,
                      activeTrackColor: hex("#78D610"),
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () => Get.dialog(
                            const HtmlComponent(data: TermsHtml.htmlTerm)),
                        child: Txt(
                          ConstantTexts.byContinueTheRegisterIDeclareTermOfUse.tr,
                          style: TxtStyle()
                            ..fontSize(12.sp)
                            ..textDecoration(TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                margin: EdgeInsets.only(top: 36.h),
                text: ConstantTexts.signUp.tr,
                onTap: () => controller.register(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                ),
                child: CustomText(
                  color: grayColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  text: ConstantTexts.alreadyHaveAnAccount.tr,
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
                  text: ConstantTexts.signIn.tr,
                  onTap: () => controller.login(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
