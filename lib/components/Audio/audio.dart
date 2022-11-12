import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
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

    var audioProvider = Provider.of<AudioProvider>(context, listen: false);

    positionEvent = audioProvider.audioPlayer.positionStream.listen((p) {
      if ((p >=
              (audioProvider.audioPlayer.duration ??
                  p + Duration(seconds: 1))) &&
          audioProvider.audioPlayer.playing) {
        if (audioProvider.audioPlayer.loopMode == LoopMode.off) {
          if (audioProvider.isLastSong()) {
            audioProvider.changePlayingState();
          }
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
