import 'package:get/get.dart';
import 'package:happy_nation/controllers/mood_controller.dart';

class MoodBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MoodController>(MoodController());
  }
}
