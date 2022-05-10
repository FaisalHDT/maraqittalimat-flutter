import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maraqittalmiat/app/data/models/detail_surah.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

class QuranDetailController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  RxBool playing = false.obs;
  var inSelected = 0.obs;
  PlayerState? state;

  RxBool isSwitched = false.obs;

  void tandaiSurat(String key, String text) async {
    await GetStorage.init();
    final box = GetStorage();
    box.write('${key}', '${text}');
  }

  Future shareText(String text) async {
    var share = await Share.share("${text}");

    return share;
  }

  Future changeSwitch() async {
    if (isSwitched.isFalse) {
      isSwitched.value = true;
    } else {
      isSwitched.value = false;
    }
  }

  getAudio(String url, int index) async {
    await audioPlayer.play("${url}");
    if (playing.isFalse) {
      inSelected.value = index + 1;
      inSelected.refresh();
      playing.value = true;
    } else {
      await audioPlayer.pause();
      playing.value = false;
      inSelected.value = index;
      inSelected.refresh();
    }

    audioPlayer.onPlayerStateChanged.listen((PlayerState status) {
      state = status;
      if (state == PlayerState.COMPLETED) {
        playing.value = false;
      } else if (state == PlayerState.PAUSED) {
        playing.value = false;
        // state = PlayerState.COMPLETED;
      }
    });
  }

  Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/${id}");
    var res = await http.get(url);

    Map<String, dynamic> data =
        await (json.decode(res.body) as Map<String, dynamic>)["data"];

    // if (data == null || data.isEmpty) {
    //   return [];
    // } else {
    //   return data.map((e) => DetailSurah.fromJson(e)).toList();
    // }

    return DetailSurah.fromJson(data);
  }
}
