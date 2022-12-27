import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/song_item.dart';

class ChartItem extends StatelessWidget {
  final int rank;
  final SongItem song;
  const ChartItem({super.key, required this.rank, required this.song});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 46,
          child: Text(
            rank.toString(),
            style: TextStyle(
                fontSize: 24,
                color: rank == 1
                    ? const Color(0xfff0a50e)
                    : rank == 2
                        ? const Color(0x99aa4cfc)
                        : rank == 3
                            ? const Color(0xff27b6fc)
                            : Colors.white),
          ),
        ),
        Expanded(child: song)
      ],
    );
  }
}
