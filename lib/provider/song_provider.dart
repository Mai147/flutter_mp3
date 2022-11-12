import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:http/http.dart' as http;

class SongProvider extends ChangeNotifier {
  List<SongModel> listSong = [];
  bool isSearching = false;
  int page = 1;

  void search(String searchValue, {nextPage = false}) async {
    isSearching = true;
    notifyListeners();
    int pageSize = 10;
    if (nextPage) {
      page += 1;
    } else {
      page = 1;
    }
    String apiUrl =
        "https://zing-mp3-api.onrender.com/api/v1/song?limit=$pageSize&search=$searchValue&page=$page";
    var client = http.Client();
    var jsonString = await client.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(jsonString.body);
    var songListObject = jsonObject['data'] as List;
    var newList = songListObject.map((e) {
      return SongModel.fromJson(e);
    }).toList();
    if (nextPage) {
      listSong = [...listSong, ...newList];
    } else {
      listSong = newList;
    }
    isSearching = false;
    notifyListeners();
  }
}
