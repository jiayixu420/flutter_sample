import 'dart:async';

import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/sound_asset.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/sound.dart';
import 'package:happy_nation/models/positive_word.dart';
import 'package:happy_nation/screens/user/quizz/complete/parts/random_text_widget.dart';

class CompleteQuizzController extends GetxController {
  Timer? timer;
  Timer? timer2;
  int start = 8;
  var positiveWords = <PositiveWord>[].obs;
  var positiveWordsWidgets = <RandomTextWidget>[].obs;
  var dashboardController = Get.put(DashboardController());
  var userController = Get.put(UserController());

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // createPills();
    goToReport();
  }

  @override
  void onClose() {
    super.onClose();
    timer2?.cancel();
  }

  init() {
    positiveWords.clear();
    positiveWords.add(PositiveWord(
        text: ConstantTexts.iAmIllimited.tr,
        iconPath: IconAssets.smilingFace,
        right: 7,
        top: 56));
    positiveWords.add(PositiveWord(
        text: ConstantTexts.iAmPowerful.tr,
        iconPath: IconAssets.smilingFace,
        right: 63,
        top: 143));
    positiveWords.add(PositiveWord(
        text: ConstantTexts.iAmGrateful.tr,
        iconPath: IconAssets.smilingFace,
        right: 264,
        top: 20));
    positiveWords.add(PositiveWord(
        text: ConstantTexts.iAmFocusedOnSolutions.tr,
        iconPath: IconAssets.grinningFace,
        right: 69,
        top: 304));
    positiveWords.add(PositiveWord(
        text: ConstantTexts.iChooseHappiness.tr,
        iconPath: IconAssets.grinningFace,
        right: 173,
        top: 220));
  }

  void goToReport() {
    SoundEffect.play(SoundAssets.endOfQuiz);
    dashboardController.checkIfCanJoinANewQuiz();
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
          Get.offAndToNamed('/dashboard');
        } else {
          start--;
        }
      },
    );
  }

  void createPills() {
    int index = 0;
    const oneSec = Duration(seconds: 1);
    timer2 = Timer.periodic(
      oneSec,
      (Timer timer) {
        positiveWordsWidgets.add(RandomTextWidget(
          positiveWord: positiveWords.elementAt(index),
        ));
        update();
        if (index == 4) {
          timer2?.cancel();
        } else {
          index += 1;
        }
      },
    );
  }
}
