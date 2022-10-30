import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class SongProvider extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  String source = "";

  void initAudioPLayer() {
    if (source == "assets/audio/ChuaQuenNguoiYeuCuLiveVersion.mp3") {
      return;
    }
    try {
      audioPlayer.setAsset("assets/audio/ChuaQuenNguoiYeuCuLiveVersion.mp3");
      source = "assets/audio/ChuaQuenNguoiYeuCuLiveVersion.mp3";
      // _audioPlayer.setAudioSource(AudioSource.uri(
      //     Uri.parse(url)));
      // audioPlayer.play();
    } on Exception {
      log("Error parsing song");
    }

    notifyListeners();
  }

  // void listenPositionAndDuration(
  //     void Function(Duration duration) durationCallback,
  //     void Function(Duration position) positionCallback) {
  //   audioPlayer.durationStream.listen((d) {
  //     durationCallback(d!);
  //   });

  //   audioPlayer.positionStream.listen((p) {
  //     positionCallback(p);
  //   });
  // }
}
