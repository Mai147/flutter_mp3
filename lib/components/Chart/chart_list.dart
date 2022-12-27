import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Chart/chart_item.dart';
import 'package:flutter_mp3/components/Song/song_item.dart';
import 'package:flutter_mp3/data/list_song.dart';

class ChartList extends StatelessWidget {
  const ChartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < ListSong.list.length; i++)
          ChartItem(
              rank: i + 1,
              song: SongItem(
                song: ListSong.list[i],
              ))
      ],
    );
  }
}
