import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/constants/songs/song_type.dart';
import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AudioProvider extends ChangeNotifier {
  AudioPlayer audioPlayer = AudioPlayer();
  // List<SongModel> listSong = [ListSong.list[0]];
  // List<SongModel> listUnShuffle = [ListSong.list[0]];
  // ConcatenatingAudioSource playList = ConcatenatingAudioSource(children: [
  //   AudioSource.uri(
  //       Uri.parse("asset:///assets/audio/${ListSong.list[0].audio}"),
  //       tag: MediaItem(
  //           id: ListSong.list[0].id!,
  //           title: ListSong.list[0].name!,
  //           artist: ListSong.list[0].artist,
  //           artUri: Uri.parse(Default.noImageUrl)))
  // ]);
  List<SongModel> listSong = [];
  List<SongModel> listUnShuffle = [];
  ConcatenatingAudioSource playList = ConcatenatingAudioSource(children: []);
  bool isShuffle = false;
  bool isLoading = false;

  void loading() {
    isLoading = true;
    notifyListeners();
  }

  void finishLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future<AudioSource> toAudioSource(SongModel song) async {
    String uri;
    if (song.type == SongType.assetType) {
      uri = "asset:///assets/audio/${song.audio}";
    } else if (song.type == SongType.networkType) {
      uri = "https://zing-mp3-api.onrender.com/api/v1/file/${song.audio}";
    } else {
      var documentsDirectory = await getApplicationDocumentsDirectory();
      var dir = await getExternalStorageDirectory();
      uri = "${dir?.path ?? documentsDirectory.path}/${song.audio!}";
    }
    var tag = MediaItem(
        id: song.id!,
        title: song.name!,
        artist: song.artist,
        artUri: Uri.parse(song.image ?? Default.noImageUrl));
    if (song.type == SongType.fileType) {
      return AudioSource.uri(Uri.file(uri), tag: tag);
    }
    return AudioSource.uri(Uri.parse(uri), tag: tag);
  }

  Future addItem(SongModel song) async {
    if (listSong.where((element) => element.id == song.id).toList().isEmpty) {
      listSong.add(song);
      await playList.add(await toAudioSource(song));
    }
  }

  Future playSpecificItem(SongModel song) async {
    loading();
    if (song.type == SongType.networkType) {
      String apiUrl =
          "https://zing-mp3-api.onrender.com/api/v1/song/${song.id}";
      var client = http.Client();
      await client.get(Uri.parse(apiUrl));
    }
    if (listSong.where((element) => element.id == song.id).toList().isEmpty) {
      await addItem(song);
      await audioPlayer.seekToNext();
    } else {
      var nextIndex = listSong.indexOf(song);
      await audioPlayer.seek(Duration.zero, index: nextIndex);
    }
    finishLoading();
    if (!audioPlayer.playing) {
      await audioPlayer.play();
    }
  }

  Future updateAudioService() async {
    loading();
    playList.removeRange(0, playList.length);
    listSong.forEach((song) async {
      await playList.add(await toAudioSource(song));
    });
    await audioPlayer.setAudioSource(playList);
    finishLoading();
    if (!audioPlayer.playing) {
      audioPlayer.play();
    }
    var song = getActiveSong();
    if (song.type == SongType.fileType) {
      String apiUrl =
          "https://zing-mp3-api.onrender.com/api/v1/song/${song.id}";
      var client = http.Client();
      await client.get(Uri.parse(apiUrl));
    }
  }

  void updateList(List<SongModel> list) {
    listSong = List.from(list);
    notifyListeners();
  }

  Future shuffleList() async {
    listUnShuffle = List.from(listSong);
    isShuffle = true;
    if (listSong.length == 1) {
      return;
    }
    while (listSong[0] == listUnShuffle[0]) {
      listSong.shuffle();
    }
    await updateAudioService();
  }

  Future unShuffleList() async {
    listSong = List.from(listUnShuffle);
    isShuffle = false;
    if (listSong.length == 1) {
      return;
    }
    await updateAudioService();
    notifyListeners();
  }

  void changeShuffle() async {
    isShuffle = !isShuffle;
    if (isShuffle) {
      await shuffleList();
    } else {
      await unShuffleList();
    }
    // notifyListeners();
  }

  Future initPage() async {
    await audioPlayer.setAudioSource(playList);
    notifyListeners();
  }

  Future initAudioPLayer(SongModel song) async {
    if (audioPlayer.sequenceState?.currentSource != null) {
      var currentMediaItem = getCurrentMediaItem();
      if (currentMediaItem.id == song.id) {
        return;
      }
    }
    await playSpecificItem(song);

    notifyListeners();
  }

  void changePlayingState() async {
    if ((audioPlayer.duration?.inSeconds.toDouble() ??
                audioPlayer.position.inSeconds.toDouble() + 1) <=
            audioPlayer.position.inSeconds.toDouble() &&
        !audioPlayer.playing) {
      await audioPlayer.seek(const Duration(microseconds: 0));
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

  Future nextSong() async {
    var index = playList.children.indexOf(getCurrentSource()!);
    if (index == listSong.length - 1) {
      index = 0;
    } else {
      index++;
    }
    await playSpecificItem(listSong[index]);
    notifyListeners();
  }

  Future prevSong() async {
    var index = playList.children.indexOf(getCurrentSource()!);
    if (index == 0) {
      index = listSong.length - 1;
    } else {
      index--;
    }
    await playSpecificItem(listSong[index]);
    notifyListeners();
  }

  IndexedAudioSource? getCurrentSource() {
    var source = audioPlayer.sequenceState!.currentSource;
    return source;
  }

  MediaItem getCurrentMediaItem() {
    var metadata = audioPlayer.sequenceState!.currentSource!.tag as MediaItem;
    return metadata;
  }

  SongModel getActiveSong() {
    var currentSource = getCurrentMediaItem();
    var song =
        listSong.where((song) => song.id == currentSource.id).toList()[0];
    return song;
  }

  bool isInList(SongModel song) {
    return listSong.where((element) => element.id == song.id).isNotEmpty;
  }

  bool isFirstSong() {
    return audioPlayer.previousIndex == null;
  }

  bool isLastSong() {
    return audioPlayer.nextIndex == null;
  }

  bool removeSong(SongModel song) {
    var currentMediaItem = getCurrentMediaItem();
    if (currentMediaItem.id != song.id) {
      var index = listSong.indexWhere((element) => element.id == song.id);
      listSong.removeAt(index);
      playList.removeAt(index);
      listUnShuffle.removeWhere((element) => element.id == song.id);
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  void removeAll() {
    var currentMediaItem = getCurrentMediaItem();
    var index =
        listSong.indexWhere((element) => element.id == currentMediaItem.id);
    listSong.removeWhere((element) => element.id != currentMediaItem.id);
    listUnShuffle.removeWhere((element) => element.id != currentMediaItem.id);
    playList.removeRange(0, index);
    playList.removeRange(1, playList.length);
    notifyListeners();
  }
}
