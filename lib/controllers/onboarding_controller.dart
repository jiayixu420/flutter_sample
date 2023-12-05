import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/draw_assets.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/language_controller.dart';
import 'package:happy_nation/controllers/storage_controller.dart';
import 'package:happy_nation/models/onboarding.dart';

class OnBoardingController extends GetxController {
  var pageController = PageController();
  var currentPage = 0.obs;
  var currentIndex = 0;
  var lastIndex = 0;
  int start = 2;
  late Timer timer;
  var onBordingItems = <OnBoarding>[];
  var storageController = Get.put(StorageController());
  var langController = Get.put(LanguageController());
  final CarouselController carouselController = CarouselController();

  @override
  void onInit() {
    super.onInit();
    init();
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
    langController.checkLang();
  }

  @override
  void onClose() {
    super.onClose();
    timer.cancel();
  }

  int currentElement() {
    if (currentIndex < 2) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    return currentIndex;
  }

  void onPageChanged(int index) {
    bool right = lastIndex < index;
    if (currentPage.value < 2) {
      currentPage.value = right ? currentPage.value + 1 : currentPage.value - 1;
      currentPage.value = currentPage.value < 0 ? 2 : currentPage.value;
    } else {
      currentPage.value = 0;
    }
    lastIndex = index;
    start = 2;
    update();
  }

  void init() {
    onBordingItems.clear();
    onBordingItems.add(OnBoarding(
      imgPath: DrawAssets.draw12Svg,
      text1: ConstantTexts.doYouKnowThatAPositiveBrainIs30MoreProductive.tr,
    ));
    onBordingItems.add(OnBoarding(
      imgPath: DrawAssets.draw11Svg,
      text1: ConstantTexts.happinessIsTheHighestFormOfHealth.tr,
    ));
    onBordingItems.add(OnBoarding(
      imgPath: DrawAssets.draw6Svg,
      text1: ConstantTexts
          .happinessIsDeterminedMoreByOnesStateOfMindThanByExternalEvents.tr,
    ));
  }

  // timer for carousel
  void startTimer() {
    int indexOfPage = 0;
    const oneSec = Duration(seconds: 4);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          if (currentPage.value == (onBordingItems.length - 1)) {
            currentPage.value = 0;
          } else {
            currentPage.value++;
          }
          pageController.animateToPage(
            ++indexOfPage,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
          start = 2;
        } else {
          start--;
        }
      },
    );
  }

  Future<void> getStarted() async {
    storageController.setData(data: true, key: 'onBoarding');
    Get.offAndToNamed('/guest-home');
  }
}
