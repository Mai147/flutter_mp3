import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/pages/song_page.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class AudioPlayerBottomNavbar extends StatefulWidget {
  const AudioPlayerBottomNavbar({super.key});

  @override
  State<AudioPlayerBottomNavbar> createState() =>
      _AudioPlayerBottomNavbarState();
}

class _AudioPlayerBottomNavbarState extends State<AudioPlayerBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return InkWell(
      onTap: () {
        var modal = BottomModal(
            context: context,
            child: SongPage(
              song: audioProvider.getActiveSong(),
            ));
        modal.initFullScreenModal();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
            border: Border(
                top: BorderSide(
                    color: Theme.of(context).shadowColor, width: 3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                audioProvider.getActiveSong().image ??
                                    Default.noImageUrl),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          audioProvider.getActiveSong().name!,
                          style: Theme.of(context).textTheme.displaySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          audioProvider.getActiveSong().artist ??
                              Default.songArtist,
                          style: Theme.of(context).textTheme.labelSmall,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minHeight: 46, minWidth: 44),
                  icon: Icon(CupertinoIcons.heart,
                      color: Theme.of(context).primaryColorDark),
                ),
                IconButton(
                  onPressed: () {
                    audioProvider.changePlayingState();
                  },
                  constraints:
                      const BoxConstraints(minHeight: 46, minWidth: 44),
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    audioProvider.audioPlayer.playing
                        ? Icons.pause
                        : Icons.play_arrow_rounded,
                    size: 34,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    audioProvider.nextSong();
                  },
                  padding: EdgeInsets.zero,
                  constraints:
                      const BoxConstraints(minHeight: 46, minWidth: 44),
                  icon: Icon(
                    Icons.skip_next_rounded,
                    size: 38,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
