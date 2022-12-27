import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal_item.dart';
import 'package:flutter_mp3/components/Layout/TopNavbar/Search/search.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/data/list_playlist.dart';

class PlaylistModal extends StatelessWidget {
  const PlaylistModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thêm bài hát vào playlist",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Search(
            searchFunc: (value) {},
            isFocus: false,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BottomModalItem(
                    title: "Tạo playlist mới",
                    margin: 0,
                    prefix: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).backgroundColor),
                      child: const Icon(
                        Icons.add,
                        size: 40,
                      ),
                    )),
                ...ListPlaylist.list
                    .map((e) => BottomModalItem(
                          title: e.name,
                          margin: 0,
                          prefix: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        e.listSong.first.image ??
                                            Default.noImageUrl),
                                    fit: BoxFit.cover)),
                          ),
                        ))
                    .toList()
              ],
            ),
          ),
        )
      ],
    );
  }
}
