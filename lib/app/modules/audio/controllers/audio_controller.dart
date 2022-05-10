import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  AudioPlayer playing = AudioPlayer();
  AudioCache player = AudioCache();
  RxBool isPlaying = false.obs;
  void playSound(String name) async {
    final player = AudioCache();
    await player.load('audio/${name}');

    if (isPlaying.isFalse) {
      isPlaying.value = true;
      await player.play("audio/${name}");
    } else {
      await playing.pause();

      isPlaying.value = false;
    }
  }

  void stopPlay() {
    playing.stop();
    isPlaying.value = false;
  }
}
