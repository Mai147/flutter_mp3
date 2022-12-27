import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/SongComment/song_comment.dart';
import 'package:flutter_mp3/components/Song/SongComment/song_comment_item.dart';

class SongCommentList extends StatelessWidget {
  const SongCommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [for (var i = 0; i < 3; i++) const SongCommentItem()],
    );
  }
}
