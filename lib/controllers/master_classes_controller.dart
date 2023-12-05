import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/models/video.dart';
import 'package:happy_nation/repositories/video_repository.dart';

class MasterClassesController extends GetxController {
  var videos = <Video>[].obs;
  var userController = Get.put(UserController());
  var isLoading = false.obs;
  final zoomDrawerController = ZoomDrawerController();

  @override
  onInit() {
    super.onInit();
    listenForListOfVideo();
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  // get list of Videos
  Future<void> listenForListOfVideo() async {
    isLoading.value = true;
    update();
    final Stream<Video> stream =
        await getVideoList(token: userController.currentUser.token!);
    stream.listen(
      (Video _video) {
        videos.add(_video);
      },
      onError: (a) {},
      onDone: () {
        isLoading.value = false;
        update();
      },
    );
  }
}
