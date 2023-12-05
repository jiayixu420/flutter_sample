import 'dart:convert';
import 'dart:io';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happy_nation/constants/texts_en.dart';
import 'package:happy_nation/controllers/media_controller.dart';
import 'package:happy_nation/controllers/storage_controller.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/helper.dart';
import 'package:happy_nation/helpers/loading.dart';
import 'package:happy_nation/models/city.dart';
import 'package:happy_nation/models/company.dart';
import 'package:happy_nation/models/register.dart';
import 'package:happy_nation/models/user.dart';
import 'package:happy_nation/repositories/register_repository.dart'
    as register_repo;

class RegisterController extends GetxController {
  var registerKey = GlobalKey<FormState>(debugLabel: 'register-key');
  var user = User().obs;
  var storageController = Get.put(StorageController());
  var userController = Get.put(UserController());
  var mediaController = Get.put(MediaController());
  // var localNotificationController = Get.put(LocalNotificationController());
  var imagePath = ''.obs;
  var imgSelected = false.obs;
  var isAgree = false.obs;
  var functionFieldValidation = true.obs;
  var registerModel = Register().obs;
  var city = City();
  var cityController = TextEditingController().obs;
  var genderController = TextEditingController().obs;
  var functionController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    user.value.company = Company();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   registerData();
  // }

  List<City> get cities => registerModel.value.cities!;

  registerData() {
    Loading.open();
    var response = register_repo.registerData();
    response.then((value) {
      if (value.statusCode == 200) {
        registerModel.value = Register.fromJSON(value.body['data']);
        update();
      }
    }).whenComplete(() {
      Loading.close();
      update();
    }).catchError((error) {
      Loading.close();
      debugPrint("homeData $error");
    });
  }

  onCityChange(String value) {
    cityController.value.text = value;
    city = cities.firstWhere((element) => element.name == value);
    update();
  }

  onGenderChange(String value) {
    genderController.value.text = value;
    user.value.gender = value;
    update();
  }

  onFunctionChange(String value) {
    functionController.value.text = value;
    user.value.function = value;
    update();
  }

  // changed Argument value
  setArgument(value) {
    isAgree.value = !!value;
    update();
  }

  bool get validateDropDownAttr {
    try {
      //|| user.value.gender!.isEmpty
      if (user.value.function!.isEmpty) {
        functionFieldValidation.value = false;
        update();
        return false;
      }
      functionFieldValidation.value = true;
      update();
      return true;
    } catch (e) {
      functionFieldValidation.value = false;
      update();
      return false;
    }
  }

  // creation a new account
  Future<void> register() async {
    if (!validateDropDownAttr) {
      Helper.customSnackBar(
        title: ConstantTexts.message.tr,
        duration: const Duration(seconds: 10),
        message: ConstantTexts.pleaseCompleteAllRequired.tr,
        snackPosition: SnackPosition.TOP,
        color: Colors.red,
      );
    }
    // check if form is validate
    if (registerKey.currentState!.validate()) {
      // save current state of form
      registerKey.currentState!.save();
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
      } else if (!isAgree.value) {
        Helper.customSnackBar(
          title: ConstantTexts.message.tr,
          message: ConstantTexts.pleaseAcceptTheTerm.tr,
          snackPosition: SnackPosition.TOP,
          color: hex('#F54223'),
        );
        return;
      }
      try {
        Loading.open();
        // make request to server and receive the response
        final Stream<User> stream = await register_repo.register(user.value);
        stream.listen((User _user) async {
          if (_user.name != null) {
            storageController.setData(
                data: jsonEncode(_user.toJson()), key: 'user');
            userController.currentUser = _user;
            // await localNotificationController.listenForListOfNotification();
            Get.offAllNamed('/welcome');
          }
        }, onError: (a) {
          Loading.close();
          Helper.customSnackBar(
            title: ConstantTexts.message.tr,
            duration: const Duration(seconds: 10),
            message: a.toString(),
            snackPosition: SnackPosition.TOP,
            color: Colors.red,
          );
        }, onDone: () {
          Loading.close();
        });
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

  // make a user choice for select a image from device
  void getTaskImage() async {
    var pickedImage = await mediaController.getImageFromStorage();
    if (pickedImage != null) {
      user.value.image = pickedImage;
      imgSelected.value = true;
    } else {
      user.value.image = '';
      imgSelected.value = false;
    }
    update();
  }

  // get file from path
  File get userImg => File(user.value.image!);

  void login() => Get.toNamed('/login');
}
