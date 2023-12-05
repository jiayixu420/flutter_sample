import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/repositories/user_repository.dart';

import 'storage_controller.dart';
import 'user_controller.dart';

class ProfileController extends GetxController {
  var infoKey = GlobalKey<FormState>(debugLabel: 'infoKey');
  var userController = Get.put(UserController());
  var storageController = Get.put(StorageController());
  var user = User();
  var loading = false.obs;

  void deleteAccount() {
    Helper.customDialog(
      title: 'Title',
      message: 'do you want to delete ?'.tr,
      color: fireOpalColor,
      onConfirm: () => deleteAccountRepo(),
    );
  }

  void deleteAccountRepo() {
    Loading.open();
    var response =
        UserRepository.deleteAccount(user: userController.currentUser);
    response.then((value) {
      print(value.body);
      if (value.statusCode == 200) {
        Get.back();
        Loading.close();
        userController.logOut();
        Get.back();
        update();
      } else {
        Loading.close();
      }
    }).catchError((error) {
      Loading.close();
      debugPrint("from deleteAccountRepo = $error");
    });
  }
}
