import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class Audio extends StatefulWidget {
  const Audio({super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  var positionEvent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var songProvider = Provider.of<SongProvider>(context, listen: false);

    positionEvent = songProvider.audioPlayer.positionStream.listen((p) {
      if (p >= songProvider.audioPlayer.duration! &&
          songProvider.audioPlayer.playing &&
          songProvider.audioPlayer.loopMode == LoopMode.off) {
        if (songProvider.isLastSong()) {
          songProvider.changePlayingState();
        } else {
          songProvider.nextSong();
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    positionEvent.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
