import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/lang_dialog_widget.dart';
import 'package:happy_nation/controllers/dashboard_controller.dart';
import 'package:happy_nation/controllers/notification_controller.dart';
import 'package:happy_nation/controllers/onboarding_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';

import 'storage_controller.dart';

class LanguageController extends GetxController {
  var locale = const Locale('fr');
  var storageController = Get.put(StorageController());
  var userController = Get.put(UserController());
  var dashController = Get.put(DashboardController());
  var notifController = Get.put(NotificationController());
  var isExpanded = false.obs;
  var selected = 'fr'.obs;

  bool get expanded => isExpanded.value;
  String get currentLanguage => locale.languageCode;
  bool get isEN => currentLanguage == 'en';

  @override
  void onInit() {
    super.onInit();
    getCurrentLang();
  }

  expandLanguageList() {
    isExpanded.value = !isExpanded.value;
    update();
  }

  // set locale user language
  void setLanguage(String code) {
    locale = Locale(code);
    storageController.setData(data: jsonEncode(code), key: 'lang');
    Get.updateLocale(locale);
    dashController.init();
    setUpNotifLang(code);
    if (Get.currentRoute == 'home-quizz') {
      Get.offAndToNamed('/dashboard');
    }
  }

  void setUpNotifLang(String code) {
    String old = isEN ? 'fr' : 'en';
    notifController.unSubscribeToTopic(topic: '${old}_users');
    notifController.subscribeToTopic(topic: '${code}_users');
  }

  // set selected lang
  void selectedLang(String code) {
    selected.value = code;
    update();
  }

  void confirmSelectedLang() {
    setLanguage(selected.value);
    Get.find<OnBoardingController>().init();
    Get.back();
  }

  // get default user language
  Future<void> getCurrentLang() async {
    if (storageController.hasData(key: 'lang')) {
      locale = Locale(jsonDecode(await storageController.getData(key: 'lang')));
      Get.updateLocale(locale);
      setUpNotifLang(locale.languageCode.toLowerCase());
    } else {
      setUpNotifLang('fr');
    }
  }

  checkLang() {
    if (!storageController.hasData(key: 'lang')) {
      Get.dialog(const LangDialogWidget());
    }
  }
}
