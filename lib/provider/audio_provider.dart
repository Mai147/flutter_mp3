import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:just_audio/just_audio.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  List<SongModel> listSong = [ListSong.list[0]];
  List<SongModel> listUnShuffle = [ListSong.list[0]];
  String activeId = ListSong.list[0].id!;
  bool isShuffle = false;

  void updateList(List<SongModel> list) {
    listSong = List.from(list);
    notifyListeners();
  }

  SongModel shuffleList() {
    listUnShuffle = List.from(listSong);
    listSong.shuffle();
    isShuffle = true;
    notifyListeners();
    return listSong[0];
  }

  SongModel unShuffleList() {
    listSong = List.from(listUnShuffle);
    isShuffle = false;
    notifyListeners();
    return listSong[0];
  }

  void changeShuffle() {
    isShuffle = !isShuffle;
    if (isShuffle) {
      var song = shuffleList();
      initAudioPLayer(song);
    } else {
      var song = unShuffleList();
      initAudioPLayer(song);
    }
    notifyListeners();
  }

  Future setAssetSource(SongModel song) async {
    try {
      activeId = song.id!;
      // await audioPlayer.setAudioSource(AudioSource.uri(
      //   Uri.file("file:///android_asset/audio/${song.url}"),
      //   tag: MediaItem(
      //     id: "${song.id}",
      //     album: "Album name",
      //     title: "${song.title}",
      //     artUri: Uri.parse('https://example.com/albumart.jpg'),
      //   ),
      // ));
      // await audioPlayer.setAsset("assets/audio/${song.audio}");
      await audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse("asset:///assets/audio/${song.audio}")));
      if (!audioPlayer.playing) {
        changePlayingState();
      }
    } on Exception {
      log("Error parsing song");
    }
  }

  Future setNetworkSource(SongModel song) async {
    try {
      activeId = song.id!;
      if (audioPlayer.playing) {
        changePlayingState();
      }
      String apiUrl =
          "https://zing-mp3-api.onrender.com/api/v1/file/${song.audio}";
      await audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse(apiUrl),
      ));
      if (!audioPlayer.playing) {
        changePlayingState();
      }
    } on Exception {
      log("Error parsing song");
    }
  }

  Future setSource(SongModel song) async {
    if (song.isNetworkSource == true) {
      await setNetworkSource(song);
    } else {
      await setAssetSource(song);
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
        !audioPlayer.playing) {
      audioPlayer.seek(const Duration(microseconds: 0));
    }
    audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play();

    notifyListeners();
  }

  void changeLoopMode() {
    LoopMode currentLoop = audioPlayer.loopMode;
    switch (currentLoop) {
      case LoopMode.off:
        // TODO: Handle this case.
        audioPlayer.setLoopMode(LoopMode.one);
        break;
      case LoopMode.one:
        // TODO: Handle this case.
        audioPlayer.setLoopMode(LoopMode.all);
        break;
      case LoopMode.all:
        // TODO: Handle this case.
        audioPlayer.setLoopMode(LoopMode.off);
        break;
    }
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

  bool removeSong(SongModel song) {
    if (song.id != activeId) {
      listSong.removeWhere((element) => element.id == song.id);
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }
}
