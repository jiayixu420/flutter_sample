import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/repositories/forget_password_repository.dart'
    as forget_pass_repo;

class ForgotPasswordController extends GetxController {
  var user = User().obs;
  var forgetPassKey = GlobalKey<FormState>(debugLabel: 'forgetKey');
  String resetLink = '';
  var codeVisiblity = false.obs;
  var drawMarginTop = 100.0.obs;
  late StreamSubscription<bool> keyboardSubscription;

  @override
  onInit() {
    super.onInit();
    toggleDrawMargin();
  }

  void register() => Get.toNamed('/register');

  // send reset code for check user email
  Future<void> sendCode() async {
    // check if form is validate
    if (forgetPassKey.currentState!.validate()) {
      // save current state of form
      forgetPassKey.currentState!.save();
      Loading.open();
      // make request to server and receive the response
      await forget_pass_repo.sendCodeToEmail(user.value).then((value) {
        if (!codeVisiblity.value) {
          codeVisiblity.value = true;
          update();
        } else {
          resetLink = value;
          Get.offAllNamed('/reset-password');
        }
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

  // get reset link from the server
  Future<void> getLink() async {
    // check if form is validate
    if (forgetPassKey.currentState!.validate()) {
      // save current state of form
      forgetPassKey.currentState!.save();
      Loading.open();
      // make request to server and receive the response
      await forget_pass_repo.sendLinkToEmail(user.value).then((value) {
        resetLink = value;
        Get.offAllNamed('/reset-password');
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

  void resetPasswordSteps() {
    if (!codeVisiblity.value) {
      sendCode();
    } else {
      getLink();
    }
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
