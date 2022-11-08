import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/SongPlayer/song_player_slider.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class SongPlayer extends StatefulWidget {
  // final SongModel song;

  const SongPlayer({super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  Duration duration = Duration();
  Duration position = Duration();
  double turns = 0.0;
  var durationEvent;
  var positionEvent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var audioProvider = Provider.of<AudioProvider>(context, listen: false);

    durationEvent = audioProvider.audioPlayer.durationStream.listen((d) {
      setState(() {
        duration = d!;
      });
    });

    positionEvent = audioProvider.audioPlayer.positionStream.listen((p) {
      setState(() {
        position = p;
        turns += 1.0 / 100.0;
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
    var audioProvider = Provider.of<AudioProvider>(context);
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          AnimatedRotation(
            turns: turns,
            duration: Duration(milliseconds: 300),
            child: Container(
              width: size.width - 80,
              height: size.width - 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(audioProvider.getActiveSong().image ??
                          Default.noImageUrl),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(size.width)),
            ),
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
                        onPressed: () {
                          audioProvider.changeShuffle();
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.shuffle,
                          color: audioProvider.isShuffle
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                        )),
                    IconButton(
                        onPressed: audioProvider.audioPlayer.loopMode ==
                                    LoopMode.all ||
                                !audioProvider.isFirstSong()
                            ? () {
                                audioProvider.prevSong();
                              }
                            : null,
                        icon: Icon(
                          Icons.skip_previous,
                          size: 30,
                          color: audioProvider.audioPlayer.loopMode ==
                                      LoopMode.all ||
                                  !audioProvider.isFirstSong()
                              ? Theme.of(context).primaryColorDark
                              : Theme.of(context).disabledColor,
                        )),
                    IconButton(
                        onPressed: () {
                          audioProvider.changePlayingState();
                        },
                        constraints:
                            const BoxConstraints(minHeight: 114, minWidth: 114),
                        padding: const EdgeInsets.all(24),
                        icon: Icon(
                          !audioProvider.audioPlayer.playing
                              ? Icons.play_circle_outline
                              : Icons.pause_circle_outline,
                          size: 70,
                          color: Theme.of(context).primaryColorDark,
                        )),
                    IconButton(
                        onPressed: audioProvider.audioPlayer.loopMode ==
                                    LoopMode.all ||
                                !audioProvider.isLastSong()
                            ? () {
                                audioProvider.nextSong();
                              }
                            : null,
                        icon: Icon(
                          Icons.skip_next,
                          size: 30,
                          color: audioProvider.audioPlayer.loopMode ==
                                      LoopMode.all ||
                                  !audioProvider.isLastSong()
                              ? Theme.of(context).primaryColorDark
                              : Theme.of(context).disabledColor,
                        )),
                    IconButton(
                        onPressed: () {
                          audioProvider.changeLoopMode();
                        },
                        icon: Icon(
                          audioProvider.audioPlayer.loopMode == LoopMode.one
                              ? Icons.repeat_one_rounded
                              : Icons.repeat_rounded,
                          color:
                              audioProvider.audioPlayer.loopMode == LoopMode.off
                                  ? Theme.of(context).primaryColorDark
                                  : Theme.of(context).primaryColor,
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
