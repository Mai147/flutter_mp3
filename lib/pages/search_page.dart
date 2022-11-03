import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Loading/loading.dart';
// import 'package:flutter_mp3/components/Song/song_item.dart';
// import 'package:flutter_mp3/data/list_song.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
                      return InkWell(
                        onTap: () {
                          // songProvider.getSongFile(e);
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(e.image),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              e.artist,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.playlist_add),
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert),
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints())
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ])
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 3 / 4,
                    child: Center(
                      child: Text(
                        "Không có bài hát cần tìm",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
          ),
          Loading(condition: songProvider.isSearching)
        ]));
  }
}
