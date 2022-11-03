import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/models/PlaylistModel.dart';

class ListPlaylist {
  static final list = [
    PlaylistModel(id: 1, name: "Playlist 1", listSong: [
      ListSong.list[0],
      ListSong.list[1],
      ListSong.list[2],
    ]),
    PlaylistModel(id: 2, name: "Playlist 2", listSong: [
      ListSong.list[0],
      ListSong.list[1],
    ]),
    PlaylistModel(id: 3, name: "Playlist 3", listSong: [
      ListSong.list[1],
      ListSong.list[2],
    ]),
    PlaylistModel(id: 4, name: "Playlist 4", listSong: [
      ListSong.list[0],
      ListSong.list[2],
    ]),
  ];
}
