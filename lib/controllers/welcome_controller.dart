import 'package:get/get.dart';
import 'package:happy_nation/constants/assets/sound_asset.dart';
import 'package:happy_nation/controllers/user_controller.dart';
import 'package:happy_nation/helpers/sound.dart';

class WelcomeUserController extends GetxController {
  var userController = Get.put(UserController());
  void homeQuiz() => Get.toNamed('/home-quizz');

  @override
  void onReady() {
    super.onReady();
    SoundEffect.play(SoundAssets.register);
  }
}
