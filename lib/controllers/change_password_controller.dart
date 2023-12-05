import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/colors.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/profile_controller.dart';
import 'package:happy_nation/controllers/storage_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/repositories/change_password_repository.dart'
    as change_repo;

class ChangePasswordController extends GetxController {
  var changePasswordKey =
      GlobalKey<FormState>(debugLabel: 'change-password-key');
  var user = User().obs;
  var storageController = Get.put(StorageController());
  var userController = Get.put(UserController());
  var profileController = Get.put(ProfileController());

  // creation a new account
  Future<void> changePassword() async {
    // check if form is validate
    if (changePasswordKey.currentState!.validate()) {
      // save current state of form
      changePasswordKey.currentState!.save();
      if (user.value.password != user.value.cPassword) {
        Helper.customSnackBar(
          title: ConstantTexts.message.tr,
          duration: const Duration(seconds: 10),
          message:
              ConstantTexts.yourPasswordAndConfirmationPasswordDoNotMatch.tr,
          snackPosition: SnackPosition.TOP,
          color: Colors.red,
        );
        return;
      }
      try {
        Loading.open();

        user.value.token = userController.currentUser.token;
        // make request to server and receive the response
        await change_repo.changePassword(user.value).then((value) {
          Loading.close();
          Get.back();
          Helper.customSnackBar(
            title: ConstantTexts.message.tr,
            message: value,
            snackPosition: SnackPosition.TOP,
            color: greenColor,
          );
          // Helper.printConsole(value.toJson());
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
        // make request to server and receive the response

      } catch (e) {
        Loading.close();
        Helper.customSnackBar(
          title: ConstantTexts.message.tr,
          duration: const Duration(seconds: 10),
          message: ConstantTexts.theGivenDataWasInvalid.tr,
          snackPosition: SnackPosition.TOP,
          color: Colors.red,
        );
      }
    }
  }
}
