import 'package:flutter/material.dart';
import 'package:flutter_mp3/models/SongModel.dart';

class SongItem extends StatelessWidget {
  final SongModel song;
  const SongItem({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          song.title,
                          style: Theme.of(context).textTheme.displayMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          song.author,
                          style: Theme.of(context).textTheme.labelMedium,
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
    );
  }
}
