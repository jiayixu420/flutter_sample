import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/components/loading_component.dart';

class Loading {
  // open loading
  static void open() =>
      Get.dialog(const LoadingComponent(), barrierDismissible: false);

  // close loading
  static void close() =>
      Get.isOverlaysOpen ? Navigator.of(Get.overlayContext!).pop() : null;
}
