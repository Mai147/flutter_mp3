import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Library/Device/library_device_item.dart';
import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class LibraryDeviceSongPage extends StatelessWidget {
  const LibraryDeviceSongPage({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return Layout(
        hasTopNav: false,
        hasAppBar: true,
        appBarTitle: "Trên thiết bị (${ListSong.list.length})",
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      audioProvider.updateList(ListSong.list);
                      var song = audioProvider.shuffleList();
                      audioProvider.initAudioPLayer(song);
                    },
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 12),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    child: Text(
                      "PHÁT NGẪU NHIÊN",
                      style: TextStyle(
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .fontSize,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bài hát",
                        style: Theme.of(context).textTheme.titleLarge),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
                      color: Theme.of(context).primaryColorDark,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: ListSong.list
                      .map((e) => LibraryDeviceItem(song: e))
                      .toList(),
                )
              ],
            ),
          ),
        ));
  }
}
