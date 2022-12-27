import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Loading/loading.dart';
import 'package:flutter_mp3/components/Song/SongComment/song_comment.dart';
import 'package:flutter_mp3/components/Song/SongPlayer/song_player_slider.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

class SongPlayer extends StatefulWidget {
  const SongPlayer({super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  Duration position = Duration();
  double turns = 0.0;
  var positionEvent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var audioProvider = Provider.of<AudioProvider>(context, listen: false);

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
    positionEvent.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    var songProvider = Provider.of<SongProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            AnimatedRotation(
                turns: turns,
                duration: Duration(milliseconds: 300),
                child: StreamBuilder<SequenceState?>(
                    stream: audioProvider.audioPlayer.sequenceStateStream,
                    builder: (context, snapshot) {
                      final state = snapshot.data;
                      if (state?.sequence.isEmpty ?? true) {
                        return Container(
                          width: size.width - 80,
                          height: size.width - 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(size.width),
                              color: Theme.of(context).primaryColor),
                        );
                      }
                      return Container(
                        width: size.width - 80,
                        height: size.width - 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: songProvider
                                        .getImage(audioProvider.getActiveSong())
                                    as ImageProvider,
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(size.width)),
                      );
                    })),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SongPlayerSlider(),
                  const SizedBox(
                    height: 30,
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
                          constraints: BoxConstraints(),
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
                              ? () async {
                                  await audioProvider.prevSong();
                                }
                              : null,
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: 30,
                          icon: Icon(
                            Icons.skip_previous,
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
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: 70,
                          icon: Icon(
                            !audioProvider.audioPlayer.playing
                                ? CupertinoIcons.play_circle
                                : CupertinoIcons.pause_circle,
                            // size: 60,
                            color: Theme.of(context).primaryColorDark,
                          )),
                      IconButton(
                          onPressed: audioProvider.audioPlayer.loopMode ==
                                      LoopMode.all ||
                                  !audioProvider.isLastSong()
                              ? () async {
                                  await audioProvider.nextSong();
                                }
                              : null,
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          iconSize: 30,
                          icon: Icon(
                            Icons.skip_next,
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
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(
                            audioProvider.audioPlayer.loopMode == LoopMode.one
                                ? Icons.repeat_one_rounded
                                : Icons.repeat_rounded,
                            color: audioProvider.audioPlayer.loopMode ==
                                    LoopMode.off
                                ? Theme.of(context).primaryColorDark
                                : Theme.of(context).primaryColor,
                          )),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SongComment(),
            )
          ],
        ),
      ),
      audioProvider.isLoading
          ? Loading(condition: audioProvider.isLoading)
          : Container()
    ]);
  }
}
