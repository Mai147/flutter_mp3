import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  List<SongModel> listSong = [ListSong.list[0]];
  int activeId = ListSong.list[0].id;

  Future setSource(SongModel song) async {
    try {
      activeId = song.id;
      // await audioPlayer.setAudioSource(AudioSource.uri(
      //   Uri.file("file:///android_asset/audio/${song.url}"),
      //   tag: MediaItem(
      //     id: "${song.id}",
      //     album: "Album name",
      //     title: "${song.title}",
      //     artUri: Uri.parse('https://example.com/albumart.jpg'),
      //   ),
      // ));
      await audioPlayer.setAsset("assets/audio/${song.url}");
      if (!audioPlayer.playing) {
        changePlayingState();
      }
    } on Exception {
      log("Error parsing song");
    }
  }

  void initAudioPLayer(SongModel song) async {
    if (getActiveSong().id == song.id) {
      return;
    }

    if (listSong.where((element) => element.id == song.id).toList().isEmpty) {
      listSong.add(song);
    }

    await setSource(song);
    notifyListeners();
  }

  SongModel getActiveSong() {
    var song = listSong.where((song) => song.id == activeId).toList()[0];
    return song;
  }

  void changePlayingState() {
    if (audioPlayer.duration!.inSeconds.toDouble() <=
            audioPlayer.position.inSeconds.toDouble() &&
        audioPlayer.loopMode == LoopMode.off &&
        !audioPlayer.playing) {
      audioPlayer.seek(const Duration(microseconds: 0));
    }
    audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play();

    notifyListeners();
  }

  void changeLoopMode() {
    LoopMode currentLoop = audioPlayer.loopMode;
    audioPlayer
        .setLoopMode(currentLoop == LoopMode.one ? LoopMode.off : LoopMode.one);
    notifyListeners();
  }

  void nextSong() async {
    int index = listSong.indexOf(getActiveSong());
    if (index == listSong.length - 1) {
      index = 0;
    } else {
      index++;
    }
    await setSource(listSong[index]);
    notifyListeners();
  }

  void prevSong() async {
    int index = listSong.indexOf(getActiveSong());
    if (index == 0) {
      index = listSong.length - 1;
    } else {
      index--;
    }
    await setSource(listSong[index]);
    notifyListeners();
  }

  bool isFirstSong() {
    int index = listSong.indexOf(getActiveSong());
    return index == 0;
  }

  bool isLastSong() {
    int index = listSong.indexOf(getActiveSong());
    return index == listSong.length - 1;
  }
}
