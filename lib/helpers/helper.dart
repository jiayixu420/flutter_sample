import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Helper {
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final Random rnd = Random();
  static RegExp regExp = RegExp(
    r"^[+]{1}[0-9]{11,14}", //[+]{1}[0-9]{11,14}
    caseSensitive: false,
    multiLine: false,
  );
  // custom snack bar
  static void customSnackBar({
    required String title,
    required String message,
    SnackPosition? snackPosition,
    Color? color,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      ConstantTexts.error.tr,
      backgroundColor: color ?? greenColor,
      colorText: Colors.white,
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20.h),
      duration: duration,
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // custom dialog
  static void customDialog({
    required String title,
    required String message,
    SnackPosition? snackPosition,
    Duration? duration = const Duration(seconds: 3),
    Color? color,
    Function()? onConfirm,
  }) {
    Get.defaultDialog(
      title: "Delete your account".tr,
      middleText: "Hello world!",
      backgroundColor: color ?? greenColor,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      textConfirm: "Confirmer".tr,
      textCancel: "Cancel".tr,
      cancelTextColor: Colors.white,
      confirmTextColor: Colors.white,
      buttonColor: color,
      barrierDismissible: true,
      radius: 10.r,
      onConfirm: onConfirm,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        // textAlign: TextAlign.center,
      ),
    );
  }

  // print method for disable it on release mode
  static void printConsole(text) {
    // print(text);
  }

  static todayDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  static diffInDays(date) {
    DateTime startDate = DateTime.parse(date);
    var now = DateTime.now();
    final difference = now.difference(startDate).inDays;

    return difference;
  }

  static Future<ui.Image> loadImage({required String assetPath}) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();

    return fi.image;
  }

  // print method for disable it on release mode
  static int random({int start = 0, int end = 100}) {
    int randomNumber = rnd.nextInt(end) + start;

    return randomNumber;
  }

  // custom validation message
  static errorMessage(String field) => '$field ${ConstantTexts.isRequired.tr}';

  // custom Header Request
  static customHeader({String? token}) {
    String auth = 'Bearer $token';
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader:
          token == null ? 'application/json' : auth,
    };
  }

  static getData(data) {
    return data['data'] ?? [];
  }

  static getErrors(data) {
    Helper.printConsole(data);
    return data['errors'] ?? [];
  }

  // get validation message from api
  static validationMessage(errors) {
    String messages = '';

    for (var element in (errors as Map).entries) {
      messages += '\n - ${element.value[0]}';
    }

    return messages;
  }

  // generating a random string
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}
