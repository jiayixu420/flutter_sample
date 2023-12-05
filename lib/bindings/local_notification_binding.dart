import 'package:get/get.dart';
import 'package:happy_nation/controllers/local_notification_controller.dart';

class LocalNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LocalNotificationController>(LocalNotificationController());
  }
}
