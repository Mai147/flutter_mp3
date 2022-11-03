import 'package:flutter/material.dart';
import 'package:flutter_mp3/models/PlaylistModel.dart';

class PlayListItem extends StatelessWidget {
  final PlaylistModel playlist;

  const PlayListItem({required this.playlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              playlist.name,
              maxLines: 1,
            ))
          ],
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
