// import 'package:audioplayers/audioplayers.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioPlayerBottomNavbar extends StatefulWidget {
  const AudioPlayerBottomNavbar({super.key});

  @override
  State<AudioPlayerBottomNavbar> createState() =>
      _AudioPlayerBottomNavbarState();
}

class _AudioPlayerBottomNavbarState extends State<AudioPlayerBottomNavbar> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Listen to state: playing, paused, stopped
    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.playing;
    //   });
    // });
  }

  Future setAudio() async {
    // Repeat song when complete
    // audioPlayer.setReleaseMode(ReleaseMode.loop);

    // Load audio from Assets
    // final player = AudioCache(prefix: 'assets/audio');
    // final url = await player.load('ChuaQuenNguoiYeuCuLiveVersion.mp3');
    // audioPlayer
    //     .setSourceAsset("assets/audio/ChuaQuenNguoiYeuCuLiveVersion.mp3");
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   // audioPlayer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // assetsAudioPlayer
    //     .open(Audio("assets/audio/ChuaQuenNguoiYeuCuLiveVersion.mp3"));
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
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
                        "Lâu Lâu Nhắc Lại",
                        style: Theme.of(context).textTheme.displaySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Hà Nhi, Khói",
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
                constraints: const BoxConstraints(minHeight: 46, minWidth: 44),
                icon: Icon(CupertinoIcons.heart,
                    color: Theme.of(context).primaryColorDark),
              ),
              IconButton(
                onPressed: () async {
                  if (isPlaying) {
                    // await audioPlayer.pause();
                  } else {
                    // await audioPlayer.resume();
                  }
                },
                constraints: const BoxConstraints(minHeight: 46, minWidth: 44),
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.play_arrow_rounded,
                  size: 34,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minHeight: 46, minWidth: 44),
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
    );
  }
}
