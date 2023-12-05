import 'dart:io';

import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/icon_assets.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/menu_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/report.dart';
import 'package:happy_nation/models/slider.dart';
import 'package:happy_nation/repositories/dashboard_repository.dart';
import 'package:happy_nation/repositories/report_repository.dart';

class DashboardController extends GetxController {
  var sliderList = <SliderImage>[].obs;
  final CarouselController buttonCarouselController = CarouselController();
  Size initSize = const Size(83.25, 75.34);
  Size selectedSize = const Size(163.25, 147.74);
  var sliderImage = SliderImage.init().obs;
  var report = Report().obs;
  var isLoading = false.obs;
  var userController = Get.put(UserController());
  var menuController = Get.put(MenuController());
  PDFDocument? doc;
  var canAnswer = false.obs;
  var goToSpecPage = -1;
  final zoomDrawerController = ZoomDrawerController();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  bool get isAndroid => Platform.isAndroid;

  // check if user can autorized to make a new quiz
  Future<void> checkIfCanJoinANewQuiz() async {
    init();
    final Stream<bool> stream = await checkUserIfCanAnswerAnewQuiz(
        token: userController.currentUser.token!);
    stream.listen(
      (value) {
        canAnswer.value = value;
      },
      onError: (a) {},
      onDone: () {
        update();
      },
    );
  }

  // get list of Videos
  Future<void> listenForReport() async {
    Loading.open();
    final Stream<Report> stream =
        await getReportList(token: userController.currentUser.token!);
    stream.listen(
      (Report _report) {
        report.value = _report;
      },
      onError: (a) {
        Loading.close();
      },
      onDone: () {
        if (report.value.file == null) {
          Loading.close();
        } else {
          reportViewer();
        }
      },
    );
  }

  // open screen for view the report
  Future<void> reportViewer() async {
    doc = await PDFDocument.fromURL(report.value.file!);
    Loading.close();
    Get.toNamed('/report-viewer');
  }

  // init the slider items on the dashboard
  void init() {
    sliderList.clear();
    sliderList.add(
      SliderImage(
        id: 1,
        description: ConstantTexts
            .nowYouCanDiscoverYourHappinessReportAwarenessIsHalfOfTheRealisation
            .tr,
        image: IconAssets.report,
        size: selectedSize,
        btnTxt: ConstantTexts.viewYourReport.tr,
        route: '/reports',
        icon: Icons.remove_red_eye_outlined,
        height: 20,
        width: 25,
      ),
    );
    sliderList.add(
      SliderImage(
        id: 0,
        description: ConstantTexts.watchTheMasterclassThatMatchesYourNeeds.tr,
        image: IconAssets.video,
        size: initSize,
        btnTxt: ConstantTexts.watchMasterclasses.tr,
        route: '/master-classes',
        icon: Icons.play_arrow_rounded,
        height: 20,
        width: 30,
      ),
    );
    sliderList.add(
      SliderImage(
        id: 2,
        description: ConstantTexts
            .youHaveAlreadyPassedTheQuizStayTunedForANewOneSeeYouSoon.tr,
        description2: ConstantTexts.browseAndSelectFromTheHappyTools.tr,
        image: IconAssets.quiz,
        size: initSize,
        btnTxt: ConstantTexts.startYourQuiz.tr,
        route: '/home-quizz',
      ),
    );

    sliderImage.value = sliderList.elementAt(0);
  }

  // changed icon size on page changed
  void onPageChanged(index) {
    for (var element in sliderList) {
      element.size = initSize;
    }
    sliderList.elementAt(index).size = selectedSize;
    sliderImage.value = sliderList.elementAt(index);
    update();
  }

  // go to specific page
  void goToPage(index) => buttonCarouselController.jumpToPage(index);

  void onTap() {
    if (sliderImage.value.id == 1) {
      listenForReport();
    } else if (sliderImage.value.id == 2 && !canAnswer.value) {
      // Get.toNamed(sliderImage.value.route!);
      return;
    } else {
      Get.toNamed(sliderImage.value.route!);
    }
  }
}
