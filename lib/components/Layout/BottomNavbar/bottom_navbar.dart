import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/audio_player_bottom_navbar.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/bottom_navbar_item.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AudioPlayerBottomNavbar(),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor)),
              color: Theme.of(context).bottomAppBarColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                BottomNavbarItem(
                  icon: Icons.video_library,
                  label: "Cá nhân",
                  isActive: true,
                ),
                BottomNavbarItem(icon: Icons.adjust, label: "Khám phá"),
                BottomNavbarItem(icon: Icons.show_chart, label: "Zingchart"),
                BottomNavbarItem(icon: Icons.radio, label: "Radio"),
                BottomNavbarItem(icon: Icons.newspaper, label: "Theo dõi"),
              ],
            )),
      ],
    );
  }
}
