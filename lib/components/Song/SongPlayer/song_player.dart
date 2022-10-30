import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/SongPlayer/song_player_slider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SongPlayer extends StatefulWidget {
  const SongPlayer({super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  Duration duration = Duration();
  Duration position = Duration();
  bool isPlaying = true;
  bool isRandom = false;
  bool isRepeat = true;
  var durationEvent;
  var positionEvent;
  // StreamSubscription durationEvent = StreamSubscription();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var songProvider = Provider.of<SongProvider>(context, listen: false);
    songProvider.initAudioPLayer();
    isPlaying = songProvider.audioPlayer.playing;
    isRepeat = songProvider.audioPlayer.loopMode == LoopMode.one;

    durationEvent = songProvider.audioPlayer.durationStream.listen((d) {
      setState(() {
        duration = d!;
      });
    });

    positionEvent = songProvider.audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    durationEvent.cancel();
    positionEvent.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var songProvider = Provider.of<SongProvider>(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
            width: size.width - 80,
            height: size.width - 80,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(size.width)),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SongPlayerSlider(
                  duration: duration,
                  position: position,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.shuffle,
                          color: isRandom
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_previous,
                          size: 30,
                          color: Theme.of(context).primaryColorDark,
                        )),
                    IconButton(
                        onPressed: () {
                          if (isPlaying) {
                            songProvider.audioPlayer.pause();
                          } else {
                            songProvider.audioPlayer.play();
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        constraints:
                            const BoxConstraints(minHeight: 114, minWidth: 114),
                        padding: const EdgeInsets.all(24),
                        icon: Icon(
                          !isPlaying
                              ? Icons.play_circle_outline
                              : Icons.pause_circle_outline,
                          size: 70,
                          color: Theme.of(context).primaryColorDark,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.skip_next,
                          size: 30,
                          color: Theme.of(context).primaryColorDark,
                        )),
                    IconButton(
                        onPressed: () {
                          LoopMode currentLoop =
                              songProvider.audioPlayer.loopMode;
                          songProvider.audioPlayer.setLoopMode(
                              currentLoop == LoopMode.one
                                  ? LoopMode.off
                                  : LoopMode.one);
                          setState(() {
                            isRepeat = !isRepeat;
                          });
                        },
                        icon: Icon(
                          Icons.repeat,
                          color: isRepeat
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
