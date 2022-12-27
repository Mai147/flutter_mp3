import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Library/Device/library_device_item.dart';
import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/pages/song_page.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:provider/provider.dart';

class LibraryDeviceSongPage extends StatelessWidget {
  const LibraryDeviceSongPage({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    var songProvider = Provider.of<SongProvider>(context);
    return Layout(
        hasTopNav: false,
        hasAppBar: true,
        appBarTitle: "Trên thiết bị (${songProvider.listDeviceSong.length})",
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      audioProvider.updateList(songProvider.listDeviceSong);
                      await audioProvider.shuffleList();
                      var song = audioProvider.getActiveSong();
                      var bottomModal = BottomModal(
                          context: context,
                          child: SongPage(
                            song: song,
                          ));
                      bottomModal.initFullScreenModal();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 42, vertical: 12),
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
                      // padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  children: songProvider.listDeviceSong.isNotEmpty
                      ? songProvider.listDeviceSong
                          .map((e) => LibraryDeviceItem(song: e))
                          .toList()
                      : [Text("Không có bài hát nào")],
                )
              ],
            ),
          ),
        ));
  }
}
