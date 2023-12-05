import 'package:get/get.dart';
import 'package:happy_nation/controllers/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LanguageController>(LanguageController());
  }
}
