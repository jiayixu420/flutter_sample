import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MediaController extends GetxController {
  final picker = ImagePicker();

  // picked image from storage
  Future getImageFromStorage() async {
    if (await Permission.camera.request().isGranted) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile?.path != null) return pickedFile?.path;
    }

    return null;
  }
}
