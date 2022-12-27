import 'dart:io';

import 'package:flutter_mp3/models/SongModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  Future initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    Directory? externalStorageDirectory = await getExternalStorageDirectory();
    String path = join(
        externalStorageDirectory?.path ?? documentsDirectory.path,
        "FlutterMp3.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Songs ("
          "id TEXT PRIMARY KEY,"
          "name TEXT,"
          "image TEXT,"
          "audio TEXT,"
          "artist TEXT,"
          "like INTEGER,"
          "views INTEGER,"
          "country TEXT,"
          "lyrics TEXT)");
    });
  }

  Future<List<SongModel>> getListSong() async {
    final db = await database;
    var res = await db.query("Songs");
    return res.isNotEmpty
        ? res.map((e) => SongModel.fromDevice(e)).toList()
        : [];
  }

  Future<SongModel?> getSong(String id) async {
    final db = await database;
    var res = await db.query("Songs", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? SongModel.fromDevice(res.first) : null;
  }

  Future newSong(SongModel song, String imageUrl) async {
    final db = await database;
    var res = await db.rawInsert(
        "INSERT INTO Songs (id, name, image, audio, artist, like, views, country, lyrics)"
        " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
          song.id,
          song.name,
          imageUrl != "" ? imageUrl : null,
          song.audio,
          song.artist,
          song.like,
          song.views,
          song.country,
          song.lyrics
        ]);
    return res;
  }

  Future<int> updateSong(SongModel song, String imageUrl) async {
    final db = await database;
    var res = await db.rawUpdate(
        "UPDATE Songs SET name = ?, image = ?, audio = ?, artist = ?, like = ?, views = ?, country = ?, lyrics = ? WHERE id = ?",
        [
          song.name,
          imageUrl != "" ? imageUrl : null,
          song.audio,
          song.artist,
          song.like,
          song.views,
          song.country,
          song.lyrics,
          song.id
        ]);
    return res;
  }

  Future<int> deleteSong(SongModel song) async {
    final db = await database;
    var res = await db.delete("Songs", where: "id = ?", whereArgs: [song.id]);
    return res;
  }
}
