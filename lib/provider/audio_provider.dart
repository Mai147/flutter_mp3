import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

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

  Future setSource(SongModel song) async {
    String uri;
    if (song.isNetworkSource == true) {
      uri = "https://zing-mp3-api.onrender.com/api/v1/file/${song.audio}";
    } else {
      uri = "asset:///assets/audio/${song.audio}";
    }
    try {
      activeId = song.id!;
      await audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri),
          tag:
              MediaItem(id: song.id!, title: song.name!, artist: song.artist)));
      if (!audioPlayer.playing) {
        await audioPlayer.play();
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
        !audioPlayer.playing) {
      audioPlayer.seek(const Duration(microseconds: 0));
    }
    audioPlayer.playing ? audioPlayer.pause() : audioPlayer.play();

    notifyListeners();
  }

  void changeLoopMode() {
    LoopMode currentLoop = audioPlayer.loopMode;
    var loopArray = [LoopMode.off, LoopMode.one, LoopMode.all];
    var index = loopArray.indexOf(currentLoop);
    audioPlayer.setLoopMode(loopArray[(index + 1) % loopArray.length]);
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
