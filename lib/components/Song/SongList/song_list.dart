import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Modal/error_modal.dart';
import 'package:flutter_mp3/components/Song/song_item.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class SongList extends StatelessWidget {
  const SongList({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bài hát",
                              style: Theme.of(context).textTheme.labelLarge),
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Nghệ sĩ",
                              style: Theme.of(context).textTheme.labelLarge),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              audioProvider.getActiveSong().name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              audioProvider.getActiveSong().artist ??
                                  Default.songArtist,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(CupertinoIcons.heart),
                      SizedBox(
                        width: 6,
                      ),
                      Text("963,2K")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.headphones),
                      SizedBox(
                        width: 6,
                      ),
                      Text("38M")
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Danh sách phát",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: audioProvider.listSong.map((e) {
                return SongItem(
                  song: e,
                  canClick: false,
                  canSwipe: true,
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
