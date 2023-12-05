import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_app_bar.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/quiz_controller.dart';
import 'package:happy_nation/layouts/draw.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_nation/screens/user/quizz/parts/quizz_percent.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class QuizzLayout extends StatelessWidget {
  final String? imgPath;
  final Widget quizzWidget;
  final double drawHeight;
  final double drawWidth;
  final double drawMarginTop;
  final double drawMarginBottom;
  final VoidCallback? onTapMenu;

  final double rectangleHeight;
  const QuizzLayout({
    Key? key,
    this.imgPath,
    required this.quizzWidget,
    this.drawHeight = 120.0,
    this.drawWidth = 120.0,
    this.drawMarginTop = 18,
    this.drawMarginBottom = 0,
    this.rectangleHeight = 454,
    this.onTapMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(MainAssets.background),
            ),
          ),
          child: SafeArea(
            // top: Platform.isAndroid,
            bottom: false,
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                        color: Colors.white,
                        size: 180.h,
                      ),
                    )
                  : SingleChildScrollView(
                      controller: controller.scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 50),
                            child: CustomAppBar(
                              onTap: onTapMenu,
                            ),
                          ),
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 80),
                            child: Center(
                              child: DrawLayout(
                                imgPath: imgPath,
                                height: drawHeight,
                                width: drawWidth,
                                marginTop: drawMarginTop,
                                marginBottom: drawMarginBottom,
                              ),
                            ),
                          ),
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 120),
                            child: QuizzPercent(
                              questionNumber:
                                  controller.currentPage.value.toString(),
                              questionTotal:
                                  controller.questions.length.toString(),
                              percent: controller.percent.value,
                            ),
                          ),
                          DelayedDisplay(
                            delay: const Duration(milliseconds: 160),
                            child: quizzWidget,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                Expanded(
                                  child: DelayedDisplay(
                                    delay: const Duration(milliseconds: 200),
                                    child: CustomButton(
                                      text: ConstantTexts.back.tr,
                                      btnColor: Colors.white,
                                      txtColor: grayColor,
                                      textAlign: TextAlign.center,
                                      withIcon: false,
                                      margin: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 32, right: 8),
                                      onTap: () {
                                        if(controller.currentPage.value > 1){
                                          controller.previousPage();
                                        }else{
                                          Get.back();
                                        }
                                      } ,
                                    ),
                                  ),
                                ),
                              DelayedDisplay(
                                delay: const Duration(milliseconds: 200),
                                child: CustomButton(
                                  text: controller.currentPage.value ==
                                      controller.questions.length
                                      ? ConstantTexts.finish.tr
                                      : ConstantTexts.nextQuestion.tr,
                                  btnColor: Colors.white,
                                  txtColor: grayColor,
                                  textAlign: controller.currentPage.value ==
                                      controller.questions.length
                                      ? TextAlign.center
                                      : TextAlign.right,
                                  withIcon: !(controller.currentPage.value ==
                                      controller.questions.length),
                                  margin: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 16, right: 32),
                                  onTap: () => controller.nextPage(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
