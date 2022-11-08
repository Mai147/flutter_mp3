import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Loading/loading.dart';
import 'package:flutter_mp3/components/Song/song_item.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/pages/song_page.dart';
// import 'package:flutter_mp3/components/Song/song_item.dart';
// import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var songProvider = Provider.of<SongProvider>(context);
    return Layout(
        hasTopNav: false,
        hasAppBar: true,
        isSearchPage: true,
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: songProvider.listSong.isNotEmpty
                ? Column(children: [
                    ...songProvider.listSong.map((e) {
                      return SongItem(song: e);
                    }).toList(),
                  ])
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 3 / 4,
                    child: Center(
                      child: Text(
                        Default.searchResult,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
          ),
          Loading(condition: songProvider.isSearching)
        ]));
  }
}
