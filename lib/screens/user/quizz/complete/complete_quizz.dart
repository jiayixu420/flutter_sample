import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/components/custom_button_left_icon.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/complete_quizz_controller.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'package:happy_nation/layouts/master.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:io';

class CompleteQuizz extends StatelessWidget {
  const CompleteQuizz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CompleteQuizzController>(
      init: CompleteQuizzController(),
      builder: (controller) => MasterLayout(
        appBar: true,
        safeAreaTop: Platform.isAndroid,
        backgroundImg: MainAssets.background3,
        drawHeight: 112.96,
        drawWidth: 219.26,
        drawMarginTop: 2,
        rectangleHeight: 814,
        bottomWidget: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    const Center(
                      child: DrawLayout(
                        imgPath: DrawAssets.draw7Svg,
                        height: 441.24,
                        width: 375.48,
                        marginTop: 38,
                      ),
                    ),
                    ...controller.positiveWordsWidgets,
                  ],
                ),
              ),
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
                  text: ConstantTexts.youMadeItYourQuizIsComplete.tr,
                  // text:
                  //     'Congrats ${controller.userController.currentUser.firstName.capitalize},',
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 24.w,
              //     right: 16.w,
              //   ),
              //   child: const CustomText(
              //     color: grayColor,
              //     fontSize: 30,
              //     fontWeight: FontWeight.w700,
              //     text: 'Your Happy journey began.',
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(
                  top: 13.h,
                  left: 50.w,
                  right: 50.w,
                  bottom: 1.h,
                ),
                child: CustomText(
                  color: lightGrayColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  text: ConstantTexts.checkYourReportAndMasterclasses.tr,
                  // 'HNB is preparing the report, meanwhile, you are awesome',
                ),
              ),
              CustomButtonLeftIcon(
                hasIcon: true,
                margin: EdgeInsets.only(top: 36.h, bottom: 30.h),
                text: ConstantTexts.yourReportIsLoading.tr,
                icon: LoadingAnimationWidget.hexagonDots(
                  color: Colors.white,
                  size: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
