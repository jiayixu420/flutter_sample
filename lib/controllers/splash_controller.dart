import 'dart:async';
import 'package:get/get.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:happy_nation/controllers/mood_controller.dart';
import 'package:happy_nation/controllers/storage_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';

import 'language_controller.dart';

class SplashController extends GetxController {
  Timer? timer;
  var start = 4.obs;
  bool check = true;
  var storageController = Get.put(StorageController());
  var languageController = Get.put(LanguageController());
  var userController = Get.put(UserController());
  var dashboardController = Get.put(DashboardController());
  var moodController = Get.put(MoodController());

  @override
  onInit() async {
    super.onInit();
    pushHomeScreen();
  }

  Future<void> pushHomeScreen() async {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          if (storageController.hasData(key: 'user')) {
            userController.initUser();
            dashboardController.checkIfCanJoinANewQuiz();
            // Get.offAllNamed('/complete-quizz');
            Get.offAllNamed('/dashboard');
            moodController.openMoodToday();
          } else if (storageController.hasData(key: 'onBoarding')) {
            Get.offAllNamed('/guest-home');
          } else {
            Get.offAllNamed('/onboarding');
          }
        } else {
          start.value--;
        }
      },
    );
  }
}
