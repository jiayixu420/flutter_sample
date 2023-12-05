import 'dart:convert';

import 'package:get/get.dart';
import 'package:happy_nation/controllers/storage_controller.dart';
import 'package:happy_nation/models/user.dart';

class UserController extends GetxController {
  var user = User().obs;
  var storageController = Get.put(StorageController());
  // var localNotificationController = Get.put(LocalNotificationController());

  // get current user data
  User get currentUser => user.value;

  // set current user data
  set currentUser(User _user) => user.value = _user;

  initUser() async {
    if (storageController.hasData(key: 'user')) {
      user.value =
          User.fromJson(jsonDecode(storageController.getData(key: 'user')));
      // await localNotificationController.listenForListOfNotification();
    }
  }

  Future<void> logOut() async {
    storageController.clearData(key: 'user');
    // await localNotificationController.cancellAll();
    Get.offAllNamed('/guest-home');
  }
}
