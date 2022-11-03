import 'package:flutter_mp3/models/SongModel.dart';

class PlaylistModel {
  int id;
  String name;
  List<SongModel> listSong;

  PlaylistModel({required this.id, required this.name, required this.listSong});
}
