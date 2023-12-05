import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/sound_asset.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:happy_nation/controllers/local_notification_controller.dart';
import 'package:happy_nation/controllers/storage_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/helpers/sound.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/repositories/login_repository.dart' as login_repo;
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'mood_controller.dart';

class LoginController extends GetxController {
  var loginKey = GlobalKey<FormState>(debugLabel: 'loginKey');
  var user = User().obs;
  var isObscrure = true.obs;
  var storageController = Get.put(StorageController());
  var userController = Get.put(UserController());
  var dashboardController = Get.put(DashboardController());
  // var localNotificationController = Get.put(LocalNotificationController());
  var moodController = Get.put(MoodController());
  var drawMarginTop = 100.0.obs;
  late StreamSubscription<bool> keyboardSubscription;

  void register() => Get.toNamed('/register');
  void forgetPassword() => Get.toNamed('/forget-password');

  @override
  onInit() {
    super.onInit();
    toggleDrawMargin();
  }

  @override
  onClose() {
    keyboardSubscription.cancel();
    super.onClose();
  }

  // make user auth
  Future<void> login() async {
    // check if form is validate
    if (loginKey.currentState!.validate()) {
      // save current state of form
      loginKey.currentState!.save();
      Loading.open();
      // make request to server and receive the response
      await login_repo.login(user.value).then((value) async {
        // Helper.printConsole(value.toJson());
        // await localNotificationController.listenForListOfNotification();
        SoundEffect.play(SoundAssets.login);
        user.value = value;
        storageController.setData(
            data: jsonEncode(value.toJson()), key: 'user');
        userController.currentUser = value;
        dashboardController.checkIfCanJoinANewQuiz();
        moodController.openMoodToday();
        Get.offAllNamed('/dashboard');
      }).catchError((e) {
        Loading.close();
        Helper.customSnackBar(
          title: ConstantTexts.message.tr,
          message: e.toString(),
          snackPosition: SnackPosition.TOP,
          color: Colors.red,
        );
      }).whenComplete(() {
        Loading.close();
      });
    }
  }

  // making the visibility toggle on password input
  togglePasswordVisibility() {
    isObscrure.value = !isObscrure.value;
    update();
  }

  void toggleDrawMargin() {
    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      drawMarginTop.value = visible ? 10 : 100;
      update();
    });
  }
}
