import 'package:flutter/material.dart';
import 'package:flutter_mp3/models/SongModel.dart';

class SongLyrics extends StatelessWidget {
  final SongModel song;

  const SongLyrics({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              song.lyrics ?? "Bài hát này chưa có lời",
              style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  height: 2.5),
            ),
          ],
        ),
      ),
    );
  }
}
