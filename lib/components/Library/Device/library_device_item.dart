import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/Library/Device/library_device_modal.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/pages/song_page.dart';

class LibraryDeviceItem extends StatelessWidget {
  final SongModel song;

  const LibraryDeviceItem({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var modal = BottomModal(
            context: context,
            child: SongPage(
              song: song,
            ));
        modal.initFullScreenModal();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                NetworkImage(song.image ?? Default.noImageUrl),
                            fit: BoxFit.cover),
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
                          song.name!,
                          style: Theme.of(context).textTheme.displayMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          song.artist ?? Default.songArtist,
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
              width: 16,
            ),
            IconButton(
              onPressed: () {
                var modal = BottomModal(
                    context: context,
                    child: LibraryDeviceModal(
                      song: song,
                    ));
                modal.initModal();
              },
              icon: const Icon(Icons.more_vert),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            )
          ],
        ),
      ),
    );
  }
}
