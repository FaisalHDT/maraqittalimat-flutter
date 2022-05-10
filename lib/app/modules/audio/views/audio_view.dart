import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/audio_controller.dart';

class AudioView extends GetView<AudioController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         elevation: 0.0,
        title: Text('AudioView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Container(
              height: 100,
              width: 100,
              child: Obx(
                () => Card(
                  color: Colors.green,
                  child: IconButton(
                    icon: controller.isPlaying.isFalse
                        ? Icon(Icons.music_note)
                        : Icon(Icons.stop),
                    onPressed: () async {
                      controller.playSound("pusaka.mp3");
                    },
                  ),
                ),
              )),
          Container(
            child: Card(
              color: Colors.green,
              child: IconButton(
                icon: Icon(Icons.music_note),
                onPressed: () {
                  controller.stopPlay();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
