import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Song/SongComment/song_comment_list.dart';

class SongComment extends StatelessWidget {
  const SongComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bình luận (130)",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 16,
              ),
              const SongCommentList(),
              Center(
                child: Text(
                  "Xem tất cả 130 bình luận",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
