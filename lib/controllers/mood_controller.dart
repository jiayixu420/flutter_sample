import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/assets/main_assets.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/mood.dart';
import 'package:happy_nation/models/random_icons.dart';
import 'package:happy_nation/screens/user/mood_alert/mood_slider_screen.dart';
import 'package:happy_nation/screens/user/mood_alert/parts/random_icon_widget.dart';
import 'package:happy_nation/screens/user/mood_alert/parts/slider_thumb_image.dart';
import 'dart:ui' as ui;
import 'package:happy_nation/screens/user/mood_alert/parts/utils.dart';
import 'package:happy_nation/repositories/mood_repository.dart' as mood_repo;

import '../constants/assets/sound_asset.dart';
import '../helpers/sound.dart';
import 'storage_controller.dart';
import 'user_controller.dart';

class MoodController extends GetxController {
  ui.Image? unHappyIcon;
  ui.Image? neutreIcon;
  ui.Image? happyIcon;
  Timer? timer;
  LinearGradient gradient = LinearGradient(colors: colors);
  var moodModel = Mood().obs;
  var currentIcon = SliderThumbImage().obs;
  var sliderValue = 1.0.obs;
  var toMoodResult = false.obs;
  var userController = Get.put(UserController());
  var storageController = Get.put(StorageController());
  var randomIconsMood = <RandomIcons>[].obs;
  var randomIconsWidgets = <RandomIconWidget>[].obs;

  @override
  onInit() {
    super.onInit();
    initIconsMoods();
  }

  openMoodToday() {
    if (storageController.hasData(key: 'mood-date')) {
      String lastDate = jsonDecode(storageController.getData(key: 'mood-date'));
      int diff = Helper.diffInDays(lastDate);
      if (diff > 0) {
        checkMood();
      }
    } else {
      checkMood();
    }
  }

  setMoodDay() {
    String formattedDate = Helper.todayDate();
    storageController.setData(
        data: jsonEncode(formattedDate), key: 'mood-date');
  }

  checkMood() {
    toMoodResult.value = false;
    sliderValue.value = 1.0;
    randomIconsMood.clear();
    randomIconsWidgets.clear();
    Future.delayed(const Duration(seconds: 1), () {
      Get.dialog(const MoodSliderScreen());
    });
  }

  initIconsMoods() async {
    await Helper.loadImage(assetPath: IconAssets.unHappyFaceBorder)
        .then((value) => unHappyIcon = value);
    await Helper.loadImage(assetPath: IconAssets.neutralFaceBorder)
        .then((value) => neutreIcon = value);
    await Helper.loadImage(assetPath: IconAssets.smileIcon)
        .then((value) => happyIcon = value);

    currentIcon.value = SliderThumbImage(image: unHappyIcon);
    update();
  }

  Future<void> onConfirm() async {
    Loading.open();
    Mood mood = Mood(moodRange: sliderValue.value.toInt().toString());
    await mood_repo
        .postMood(user: userController.currentUser, mood: mood)
        .whenComplete(() {
      Loading.close();
      switchMoodWidgetValue(sliderValue.value.toInt());
      createIconsMood();
      toMoodResult.value = true;
      setMoodDay();
      update();
    });
  }

  void onChanged(double val) {
    sliderValue.value = val;
    switchIconValue(val.toInt());
    update();
  }

  void createIconsMood() {
    var facePath = IconAssets.smillingFaceIcon;

    if (sliderValue.value.toInt() == 1) {
      facePath = IconAssets.unHappyFaceIcon;
    } else if (sliderValue.value.toInt() == 2) {
      facePath = IconAssets.neutralFaceIcon;
    } else if (sliderValue.value.toInt() == 3) {
      facePath = IconAssets.smillingFaceIcon;
    }
    for (var i = 0; i < 15; i++) {
      var right = Helper.random(end: Get.size.width.toInt());
      var top = Helper.random(end: Get.size.height.toInt());
      randomIconsMood.add(RandomIcons(
          iconPath: facePath, top: top.toDouble(), right: right.toDouble()));
    }

    for (var element in randomIconsMood) {
      randomIconsWidgets.add(RandomIconWidget(randomIcons: element));
    }
    update();
  }

  switchIconValue(int val) {
    switch (val) {
      case 1:
        currentIcon.value = SliderThumbImage(image: unHappyIcon);
        break;
      case 2:
        currentIcon.value = SliderThumbImage(image: neutreIcon);
        break;
      case 3:
        currentIcon.value = SliderThumbImage(image: happyIcon);
        break;
      default:
    }
  }

  switchMoodWidgetValue(int val) {
    switch (val) {
      case 1:
        moodModel.value = Mood(
            imgPath: MainAssets.unHappyMood,
            mood: 'Unhappy!',
            text: ConstantTexts.badMoodText);
            SoundEffect.play(SoundAssets.baroSad);
        break;
      case 2:
        moodModel.value = Mood(
            imgPath: MainAssets.neutralMood,
            mood: 'Neutral!',
            text: ConstantTexts.neutralMoodText);
            SoundEffect.play(SoundAssets.baroNeutre);
        break;
      case 3:
        moodModel.value = Mood(
            imgPath: MainAssets.happyMood,
            mood: 'Happy!',
            text: ConstantTexts.happyMoodText);
            SoundEffect.play(SoundAssets.baroHappy);
        break;
      default:
      // Handle the default case here
    }
  }
}
