import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/models/SongApiModel.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';

class SongProvider extends ChangeNotifier {
  List<SongApiModel> listSong = [];
  bool isSearching = false;

  void search(String searchValue, {nexPage = false}) async {
    isSearching = true;
    notifyListeners();
    String apiUrl =
        "https://zing-mp3-api.onrender.com/api/v1/song?search=$searchValue";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var songListObject = jsonObject['data'] as List;
    var newList = songListObject.map((e) {
      return SongApiModel.fromJson(e);
    }).toList();
    if (nexPage) {
      listSong = [...listSong, ...newList];
    } else {
      listSong = newList;
    }
    isSearching = false;
    notifyListeners();
  }

  void getSongFile(SongApiModel song) async {
    String apiUrl =
        "https://zing-mp3-api.onrender.com/api/v1/file/${song.audio}";
    var audioPlayer = AudioPlayer();
    await audioPlayer.setAudioSource(AudioSource.uri(
      Uri.parse(apiUrl),
    ));
    await audioPlayer.play();
  }
}
