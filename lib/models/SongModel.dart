import 'package:flutter_mp3/constants/songs/song_type.dart';
import 'package:on_audio_query/on_audio_query.dart' as auq;

class SongModel {
  String? id;
  String? name;
  String? image;
  String? audio;
  String? artist;
  int? like;
  int? views;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? country;
  String? originAlbum;
  List<String>? listAlbum;
  List<String>? listType;
  String? lyrics;
  int? type; // 0: asset; 1: network; 2: file

  SongModel(
      {this.id,
      this.name,
      this.image,
      this.audio,
      this.artist,
      this.like,
      this.views,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.originAlbum,
      this.listAlbum,
      this.listType,
      this.lyrics,
      this.type = SongType.assetType});

  factory SongModel.fromJson(Map<String, dynamic> obj) {
    return SongModel(
        id: obj['_id'],
        name: obj['name'],
        image: obj['image'],
        audio: obj['audio'],
        artist: obj['artistId'],
        like: obj['like'],
        views: obj['views'],
        createdAt: DateTime.parse(obj['createdAt']),
        updatedAt: DateTime.parse(obj['updatedAt']),
        country: obj['country'],
        originAlbum: obj['originAlbumIds'],
        listAlbum: obj['listAlbumIds'],
        listType: obj['listType'],
        lyrics: obj['lyrics'],
        type: SongType.networkType);
  }

  factory SongModel.fromDevice(Map<String, dynamic> obj) {
    return SongModel(
        id: obj['id'],
        name: obj['name'],
        image: obj['image'],
        audio: obj['audio'],
        artist: obj['artist'],
        like: obj['like'],
        views: obj['views'],
        country: obj['country'],
        originAlbum: obj['originAlbum'],
        lyrics: obj['lyrics'],
        type: SongType.fileType);
  }

  factory SongModel.fromOnAudioQuery(auq.SongModel song) {
    return SongModel(
        id: song.id.toString(),
        name: song.displayNameWOExt,
        // image: song.uri,
        audio: song.uri,
        artist: song.artist,
        type: SongType.fileType);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "audio": audio,
      "artist": artist,
      "like": like,
      "views": views,
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      "country": country,
      "originAlbum": originAlbum,
      "listAlbum": listAlbum.toString(),
      "listType": listType.toString(),
      "lyrics": lyrics,
      "type": type
    };
  }
}
