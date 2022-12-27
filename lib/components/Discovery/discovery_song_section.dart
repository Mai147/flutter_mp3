import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/song_item.dart';
import 'package:flutter_mp3/models/SongModel.dart';

class DiscoverySongSection extends StatelessWidget {
  final List<SongModel> list;
  const DiscoverySongSection({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...list.map((e) {
          return SongItem(
            song: e,
            canSwipe: false,
            canOpenModal: true,
          );
        }).toList()
      ],
    );
  }
}
