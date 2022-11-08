import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class SongLyrics extends StatelessWidget {
  const SongLyrics({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              audioProvider.getActiveSong().lyrics ?? Default.songLyrics,
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
