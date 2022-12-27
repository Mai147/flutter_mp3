import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Album/album_item.dart';

class AlbumList extends StatelessWidget {
  final List<Map<String, String>> list;
  const AlbumList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...list
              .map((e) => AlbumItem(
                    image: e["image"] ?? "",
                    title: e["title"] ?? "",
                    description: e["description"],
                  ))
              .toList()
        ],
      ),
    );
  }
}
