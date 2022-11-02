import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/SongLyrics/song_lyrics.dart';
import 'package:flutter_mp3/components/Song/SongPlayer/song_player.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
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
  Widget build(BuildContext context) {
    var songProvider = Provider.of<SongProvider>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songProvider.getActiveSong().title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
              ),
              Text(
                songProvider.getActiveSong().author,
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
                ? SongPlayer(
                    song: widget.song,
                  )
                : index == 1
                    ? SongLyrics(song: widget.song)
                    : Text("Hello 2");
          }),
        ));
  }
}
