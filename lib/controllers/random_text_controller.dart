import 'dart:async';

import 'package:get/get.dart';

class RandomTextController extends GetxController {
  var opacity = 0.1.obs;
  var start = 0.1.obs;
  bool reverse = false;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    const oneSec = Duration(milliseconds: 100);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value <= 0) {
          timer.cancel();
        } else if (start.value >= 1.5 && !reverse) {
          reverse = true;
        } else if (start.value < 2 && !reverse) {
          start.value += .03;
        } else {
          start.value -= .03;
        }

        if (start.value >= 0 && start.value <= 1) {
          opacity.value = start.value;
        }
        update();
      },
    );
  }
}
