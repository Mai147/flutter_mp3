import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Loading/loading.dart';
import 'package:flutter_mp3/components/Song/song_item.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var songProvider = Provider.of<SongProvider>(context, listen: false);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        songProvider.search("", nextPage: true);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

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
                ? ListView.builder(
                    itemCount: songProvider.listSong.length,
                    controller: _scrollController,
                    itemBuilder: ((context, index) {
                      return SongItem(song: songProvider.listSong[index]);
                    }),
                  )
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
