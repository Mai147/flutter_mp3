import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/SongList/song_list.dart';
import 'package:flutter_mp3/components/Song/SongLyrics/song_lyrics.dart';
import 'package:flutter_mp3/components/Song/SongPlayer/song_player.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
    var audioProvider = Provider.of<AudioProvider>(context, listen: false);
    audioProvider.initAudioPLayer(widget.song);
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
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
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  audioProvider.getActiveSong().title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                ),
                Text(
                  audioProvider.getActiveSong().author,
                  style: Theme.of(context).textTheme.labelMedium,
                  maxLines: 1,
                )
              ],
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            shadowColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              )
            ],
          ),
          body: Swiper(
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
          )),
    );
  }
}
