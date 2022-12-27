import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Discovery/discovery_song_section.dart';
import 'package:flutter_mp3/data/list_song.dart';

toListSection() {
  var chunks = [];
  int chunkSize = 4;
  var list = ListSong.list;
  for (var i = 0; i < list.length; i += chunkSize) {
    chunks.add(list.sublist(
        i, i + chunkSize > list.length ? list.length : i + chunkSize));
  }
  return chunks;
}

class DiscoverySong extends StatelessWidget {
  const DiscoverySong({super.key});

  @override
  Widget build(BuildContext context) {
    var list = toListSection();
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [...list.map((e) => DiscoverySongSection(list: e)).toList()],
    );
  }
}
