import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/audio_player_bottom_navbar.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/bottom_navbar_item.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:provider/provider.dart';

List<String> listBottomAppbarRoute = [
  "/library",
  "/discovery",
  "/krchart",
  "/radio",
  "/describe"
];

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    var currentRoute = ModalRoute.of(context)?.settings.name;

    changeRoute(var index) {
      if (currentRoute != null) {
        if (currentRoute != listBottomAppbarRoute[index]) {
          if (listBottomAppbarRoute.contains(currentRoute)) {
            Navigator.pushReplacementNamed(
                context, listBottomAppbarRoute[index]);
          } else {
            Navigator.pushNamed(context, listBottomAppbarRoute[index]);
          }
        }
      }
    }

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
                  isActive: currentRoute == listBottomAppbarRoute[0],
                  onClick: () {
                    changeRoute(0);
                  },
                ),
                BottomNavbarItem(
                  icon: Icons.adjust,
                  label: "Khám phá",
                  isActive: currentRoute == listBottomAppbarRoute[1],
                  onClick: () {
                    changeRoute(1);
                  },
                ),
                BottomNavbarItem(
                  icon: Icons.show_chart,
                  label: "Krchart",
                  isActive: currentRoute == listBottomAppbarRoute[2],
                  onClick: () {
                    changeRoute(2);
                  },
                ),
                BottomNavbarItem(
                  icon: Icons.radio,
                  label: "Radio",
                  isActive: currentRoute == listBottomAppbarRoute[3],
                  onClick: () {
                    changeRoute(3);
                  },
                ),
                BottomNavbarItem(
                  icon: Icons.newspaper,
                  label: "Theo dõi",
                  isActive: currentRoute == listBottomAppbarRoute[4],
                  onClick: () {
                    changeRoute(4);
                  },
                ),
              ],
            )),
      ],
    );
  }
}
