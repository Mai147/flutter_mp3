import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SongLyrics extends StatelessWidget {
  const SongLyrics({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: size.height * 3 / 4),
            child: StreamBuilder<SequenceState?>(
                stream: audioProvider.audioPlayer.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.music_note_list,
                        size: 60,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      Text(
                        state?.sequence.isNotEmpty ?? false
                            ? audioProvider.getActiveSong().lyrics ??
                                Default.songLyrics
                            : Default.songLyrics,
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 2.5),
                      )
                    ],
                  );
                })),
      ),
    );
  }
}
