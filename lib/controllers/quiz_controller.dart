import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/answer.dart';
import 'package:happy_nation/models/question.dart';
import 'package:happy_nation/repositories/quiz_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vibration/vibration.dart';

import 'dashboard_controller.dart';
import 'language_controller.dart';

class QuizController extends GetxController {
  var questions = <Question>[].obs;
  var userController = Get.put(UserController());
  var langController = Get.put(LanguageController());
  var dashboardController = Get.put(DashboardController());
  var isLoading = false.obs;
  var pageViewController = PageController();
  var selectedAnswers = <Answer>[].obs;
  var selectedAnsw = (-1).obs;
  var pageVSize = 0.0.obs;
  var answer = Answer().obs;
  var percent = 0.0.obs;
  var currentPage = 0.obs;
  var sliderValue = 0.0.obs;
  ScrollController? scrollController = ScrollController();
  final zoomDrawerController = ZoomDrawerController();

  @override
  onInit() {
    super.onInit();
    listenForListOfQuestion();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  // get current question
  Question get currentQst => questions.elementAt(currentPage.value - 1);

  // get list of Questions
  Future<void> listenForListOfQuestion() async {
    questions.clear();
    isLoading.value = true;
    update();
    final Stream<Question> stream = await getQuestionList(
      token: userController.currentUser.token!,
      lang: langController.currentLanguage,
    );
    stream.listen(
      (Question _question) {
        questions.add(_question);
      },
      onError: (a) {},
      onDone: () {
        isLoading.value = false;
        if (questions.isNotEmpty) {
          pageViewSize(answers: questions.first.answers!.length, index: 0);
        } else {
          Get.back();
          Helper.customSnackBar(
            title: ConstantTexts.message.tr,
            message: ConstantTexts.notFound.tr,
            snackPosition: SnackPosition.TOP,
            color: Colors.red,
          );
        }
        update();
      },
    );
  }

  // changing value when user changed slider value
  void onSliderChanged(value) {
    // vibrateOnSlider();
    sliderValue.value = value;
    update();
  }

  // vibration when changing value on the slider
  void vibrateOnSlider() {
    Vibration.vibrate(duration: 100, amplitude: 128);
  }

  // returned total of selected answers points from user
  double questionsPointCalculator() {
    // int questN = questions.length;
    double points = 0;

    for (var item in selectedAnswers) {
      points += double.parse(item.point!);
    }

    // return points / questN;
    return points / 2;
  }

  // make dyanmic page view size
  void pageViewSize({required int answers, required int index}) {
    // answer widget has height size : 50 and bottom margin : 19 = 69 = 75 for any size bug
    // multiple current answers with size 69
    // margin bottom of the question 43
    pageVSize.value = (answers * 90.h + 30.h) + 65.h;
    currentPage.value = index + 1;

    // calc percent of questions
    percentCalculator(index: index);

    // init the selected answer
    initSAnswer();
    update();
  }

  // calculating a questions percent
  void percentCalculator({required int index}) {
    double result =
        347 / (questions.length / index); // 347 with of th percent widget
    percent.value = result;
  }

  // selected answer from question
  void selectedAnswer({required Answer sAnswer, required int index}) {
    // init the answer
    answer.value = sAnswer;
    selectedAnsw.value = index;

    // scroll to the buttom screen if user selected a ansewer
    scrollController!.animateTo(scrollController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.ease);

    update();
  }

  void previousPage(){
    //if (questions.isEmpty) {
      pageViewController.previousPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
    //}
  }

  // go to next question page
  void nextPage() {
    if (questions.isEmpty) {
      Get.back();
    }
    // verify user is selected the answer or not
    if (selectedAnsw.value == -1 && currentQst.isQuestion) {
      Helper.customSnackBar(
        title: ConstantTexts.message.tr,
        message: ConstantTexts.pleaseSelectTheAnswer.tr,
        snackPosition: SnackPosition.TOP,
        color: Colors.red,
      );

      return;
    } else if (!currentQst.isQuestion) {
      answer.value = currentQst.answers!.firstWhere(
          (element) =>
              element.startAt! <= sliderValue.value &&
              element.endAt! >= sliderValue.value,
          orElse: () => currentQst.answers!.elementAt(0));
    }

    answer.value.isQuestion = currentQst.isQuestion;
    // adding answer to selected answers from user
    selectedAnswers.add(answer.value);

    // init the selected answer
    initSAnswer();

    if (currentPage.value == questions.length) {
      double total = questionsPointCalculator();
      sendResult(points: total);
      return;
    }
    // go to next page with slow animation
    pageViewController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
    sliderValue.value = 0;
  }

  // make user auth
  Future<void> sendResult({required double points}) async {
    Loading.open();
    // make request to server and receive the response
    await sendQuizResult(
      points: points,
      token: userController.currentUser.token!,
      lang: langController.currentLanguage,
    ).then((value) {
      Get.offAllNamed('/complete-quizz');
    }).catchError((e) {
      Loading.close();
      Helper.customSnackBar(
        title: ConstantTexts.message.tr,
        message: e.toString(),
        snackPosition: SnackPosition.TOP,
        color: Colors.red,
      );
      // reportNotExist();
    }).whenComplete(() {
      Loading.close();
    });
  }

  // send user to dashboard if report not exist
  void reportNotExist() {
    dashboardController.checkIfCanJoinANewQuiz();
    // Get.offAllNamed('/dashboard');
  }

  // init the selected answer
  initSAnswer() {
    answer.value = Answer();
    selectedAnsw.value = -1;
  }
}
