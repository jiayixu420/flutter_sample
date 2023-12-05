import 'package:get/get.dart';
import 'package:happy_nation/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
  }
}
