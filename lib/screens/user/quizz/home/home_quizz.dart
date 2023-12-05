import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_drawer.dart';
import 'package:happy_nation/components/expandable_page_view.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/controllers/quiz_controller.dart';
import 'package:happy_nation/layouts/quizz_layout.dart';
import 'package:happy_nation/screens/user/quizz/parts/question_component.dart';
import 'package:happy_nation/screens/user/quizz/parts/slider_component.dart';

class HomeQuizz extends StatelessWidget {
  const HomeQuizz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (controller) => CustomDrawer(
        zoomDrawerController: controller.zoomDrawerController,
        mainScreen: QuizzLayout(
          onTapMenu: () => controller.toggleDrawer(),
          imgPath: DrawAssets.draw8Svg,
          quizzWidget: controller.questions.isNotEmpty
              ? ExpandablePageView(
                  pageController: controller.pageViewController,
                  onPageChanged: (index) => controller.pageViewSize(
                      answers: controller.questions.elementAt(index).answers!.length,
                      index: index
                  ),
                  children: List.generate(
                    controller.questions.length,
                    (index) {
                      if (controller.questions.elementAt(index).isQuestion) {
                        return QustionComponent(
                          question: controller.questions.elementAt(index),
                        );
                      }
                      return SliderComponent(
                        question: controller.questions.elementAt(index),
                      );
                    },
                  ),
                )
              : const SizedBox(height: 0),
        ),
      ),
    );
  }
}
