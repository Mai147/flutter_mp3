import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
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
    var songProvider = Provider.of<SongProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/song',
            arguments: songProvider.getActiveSong());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
            border: Border(
                top: BorderSide(
                    color: Theme.of(context).dividerColor, width: 3))),
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
                        color: Colors.red,
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
                          songProvider.getActiveSong().title,
                          style: Theme.of(context).textTheme.displaySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          songProvider.getActiveSong().author,
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
                    songProvider.changePlayingState();
                  },
                  constraints:
                      const BoxConstraints(minHeight: 46, minWidth: 44),
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    songProvider.audioPlayer.playing
                        ? Icons.pause
                        : Icons.play_arrow_rounded,
                    size: 34,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    songProvider.nextSong();
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
