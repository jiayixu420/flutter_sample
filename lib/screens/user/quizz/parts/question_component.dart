import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/custom_text.dart';
import 'package:happy_nation/controllers/quiz_controller.dart';
import 'package:happy_nation/models/question.dart';
import 'package:happy_nation/screens/user/quizz/parts/answer_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QustionComponent extends StatelessWidget {
  final Question question;
  const QustionComponent({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 43.h, left: 20.w, right: 20.w),
            child: CustomText(
              text: question.question!,
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          GetBuilder<QuizController>(
            init: QuizController(),
            builder: (controller) => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: question.answers!.length,
              itemBuilder: (context, index) {
                return AnswerComponent(
                  answer: question.answers!.elementAt(index),
                  index: (index + 1),
                  onTap: () => controller.selectedAnswer(
                    sAnswer: question.answers!.elementAt(index),
                    index: index,
                  ),
                  selected: controller.selectedAnsw.value == index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
