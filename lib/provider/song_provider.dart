import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/database_provider.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SongProvider extends ChangeNotifier {
  List<SongModel> listSong = [];
  List<SongModel> listDeviceSong = [];
  Map<SongModel, bool> listDownloading = {};
  bool isSearching = false;
  int page = 1;
  int totalPage = -1;

  void search(String searchValue, {nextPage = false}) async {
    isSearching = true;
    notifyListeners();
    int pageSize = 10;
    if (nextPage) {
      page += 1;
    } else {
      page = 1;
    }
    if (totalPage == -1 || nextPage <= totalPage) {
      String apiUrl =
          "https://zing-mp3-api.onrender.com/api/v1/song?limit=$pageSize&search=$searchValue&page=$page";
      var client = http.Client();
      var jsonString = await client.get(Uri.parse(apiUrl));
      var jsonObject = jsonDecode(jsonString.body);
      var songListObject = jsonObject['data'] as List;
      totalPage = jsonObject['paginate']['totalPage'];
      var newList = songListObject.map((e) {
        return SongModel.fromJson(e);
      }).toList();
      if (nextPage) {
        listSong = [...listSong, ...newList];
      } else {
        listSong = newList;
      }
    }
    isSearching = false;
    notifyListeners();
  }

  Object getImage(SongModel song, {type = 0}) {
    if (song.image == null) {
      if (type == 0) {
        return NetworkImage(Default.noImageUrl);
      }
      return Image.network(Default.noImageUrl);
    }
    if (song.type == 2) {
      if (type == 0) {
        return FileImage(File(song.image!));
      }
      return Image.file(File(song.image!));
    }
    if (type == 0) {
      return NetworkImage(song.image!);
    }
    return Image.network(song.image!);
  }

  Future getListDeviceSong() async {
    listDeviceSong = await DBProvider.db.getListSong();
    notifyListeners();
  }

  Future saveSongToDevice(SongModel song) async {
    listDownloading[song] = true;
    notifyListeners();
    String uri = "https://zing-mp3-api.onrender.com/api/v1/file/${song.audio}";
    var response = await http.Client().get(Uri.parse(uri));
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    Directory? dir = await getExternalStorageDirectory();
    String filePath = join(dir?.path ?? documentsDirectory.path, song.audio);
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    var imgFilePath = "";
    if (song.image != null) {
      var imgRes = await http.Client().get(Uri.parse(song.image!));
      var imgFileName = song.image!.split('/').last;
      imgFilePath = join(dir?.path ?? documentsDirectory.path, imgFileName);
      File imgFile = File(imgFilePath);
      imgFile.writeAsBytesSync(imgRes.bodyBytes);
    }
    var res;
    if (await DBProvider.db.getSong(song.id!) == null) {
      res = await DBProvider.db.newSong(song, imgFilePath);
    } else {
      res = await DBProvider.db.newSong(song, imgFilePath);
    }
    listDownloading[song] = false;
    notifyListeners();
    if (res > 0) {
      getListDeviceSong();
    }
  }

  Future removeSongOutOfDevice(SongModel song) async {
    var res = await DBProvider.db.deleteSong(song);
    if (res > 0) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      Directory? dir = await getExternalStorageDirectory();
      String filePath = join(dir?.path ?? documentsDirectory.path, song.audio);
      var file = File(filePath);
      if (await file.exists()) {
        await file.delete();
      }
      getListDeviceSong();
    }
  }

  Future<bool> isDownloaded(SongModel song) async {
    var dbSong = await DBProvider.db.getSong(song.id!);
    return dbSong != null;
  }
}
