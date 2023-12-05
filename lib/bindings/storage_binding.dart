import 'package:get/get.dart';
import 'package:happy_nation/controllers/storage_controller.dart';

class StorageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StorageController>(StorageController());
  }
}
