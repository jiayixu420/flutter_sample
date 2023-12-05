import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_button.dart';
import 'package:happy_nation/components/expandable_page_view.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/onboarding_controller.dart';
import 'package:happy_nation/screens/guest/onboarding/parts/dote_component.dart';
import 'package:happy_nation/screens/guest/onboarding/parts/intro_component.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController(),
      builder: (controller) => Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(MainAssets.background3),
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExpandablePageView(
                    pageController: controller.pageController,
                    // physics: const AlwaysScrollableScrollPhysics(),
                    children: List.generate(
                      9999,
                      (index) {
                        index = controller.currentElement();
                        return IntroComponent(
                          drawPath: controller.onBordingItems
                              .elementAt(index)
                              .imgPath,
                          text:
                              controller.onBordingItems.elementAt(index).text1,
                        );
                      },
                    ),
                    // onPageChanged: (index) => controller.onPageChanged(index),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 250),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.onBordingItems.length,
                          (index) => DoteComponent(
                            width:
                                controller.currentPage.value == index ? 32 : 7,
                            select: controller.currentPage.value == index,
                          ),
                        ),
                      ),
                    ),
                  ),
                  DelayedDisplay(
                    delay: const Duration(milliseconds: 300),
                    child: CustomButton(
                      margin: EdgeInsets.only(bottom: 150.h),
                      btnColor: Colors.white,
                      txtColor: grayColor,
                      text: ConstantTexts.getStarted.tr,
                      onTap: () => controller.getStarted(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
