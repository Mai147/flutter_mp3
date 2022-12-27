import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/audio_player_bottom_navbar.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/bottom_navbar_item.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        audioProvider.listSong.isNotEmpty
            ? const AudioPlayerBottomNavbar()
            : Container(),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor)),
              color: Theme.of(context).bottomAppBarColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomNavbarItem(
                  icon: Icons.video_library,
                  label: "Cá nhân",
                  isActive: true,
                  onClick: () {
                    Navigator.pushNamed(context, "/library");
                  },
                ),
                BottomNavbarItem(
                  icon: Icons.adjust,
                  label: "Khám phá",
                  onClick: () {
                    Navigator.pushNamed(context, "/discovery");
                  },
                ),
                BottomNavbarItem(icon: Icons.show_chart, label: "Zingchart"),
                BottomNavbarItem(icon: Icons.radio, label: "Radio"),
                BottomNavbarItem(icon: Icons.newspaper, label: "Theo dõi"),
              ],
            )),
      ],
    );
  }
}
