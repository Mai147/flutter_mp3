import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/Modal/error_modal.dart';
import 'package:flutter_mp3/components/Song/SongList/song_list.dart';
import 'package:flutter_mp3/components/Song/SongLyrics/song_lyrics.dart';
import 'package:flutter_mp3/components/Song/SongPlayer/song_player.dart';
import 'package:flutter_mp3/components/Song/song_modal.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  final SongModel song;

  const SongPage({required this.song, super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AudioProvider>(context, listen: false)
          .initAudioPLayer(widget.song);
    });
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    var songProvider = Provider.of<SongProvider>(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      minimum: const EdgeInsets.only(top: 16),
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.chevron_down,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            title: StreamBuilder<SequenceState?>(
              stream: audioProvider.audioPlayer.sequenceStateStream,
              builder: ((context, snapshot) {
                final state = snapshot.data;
                if (state?.sequence.isEmpty ?? true) {
                  return const SizedBox();
                }
                final metadata = state!.currentSource!.tag as MediaItem;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      metadata.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 1,
                    ),
                    Text(
                      metadata.artist ?? Default.songArtist,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                    )
                  ],
                );
              }),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shadowColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  var bottomModal = BottomModal(
                      context: context,
                      child: SongModal(
                        song: audioProvider.getActiveSong(),
                      ));
                  bottomModal.initModal();
                },
                icon: Icon(Icons.more_vert),
              )
            ],
          ),
          body: Stack(children: [
            SizedBox(
              height: size.height,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  StreamBuilder<SequenceState?>(
                      stream: audioProvider.audioPlayer.sequenceStateStream,
                      builder: (context, snapshot) {
                        final state = snapshot.data;
                        if (state?.sequence.isEmpty ?? true) {
                          return const SizedBox();
                        }
                        return songProvider.getImage(
                            audioProvider.getActiveSong(),
                            type: 1) as Image;
                      }),
                  ClipRRect(
                    // Clip it cleanly.
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                      child: Container(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.8),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Swiper(
              itemCount: 3,
              pagination: SwiperPagination(
                  alignment: Alignment.topCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Theme.of(context).primaryColorDark,
                      activeColor: Theme.of(context).primaryColor,
                      size: 6,
                      activeSize: 6)),
              itemBuilder: ((context, index) {
                return index == 0
                    ? const SongPlayer()
                    : index == 1
                        ? const SongLyrics()
                        : const SongList();
              }),
            ),
            const ErrorModal(),
          ])),
    );
  }
}
