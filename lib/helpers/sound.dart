import 'package:audioplayers/audioplayers.dart';

class SoundEffect {
  static AudioCache audioPlayer = AudioCache();
  static Future<void> play(localPath) async {
    await audioPlayer.play(localPath);
  }
}
