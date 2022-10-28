import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Library/library_navbar.dart';
import 'package:flutter_mp3/components/Library/library_slider_item.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thư viện",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          LibrabySliderItem(
                            isRawIcon: true,
                            icon: CupertinoIcons.heart_fill,
                            colors: [Colors.greenAccent, Colors.blueAccent],
                            title: "Bài hát",
                            count: 50,
                          ),
                          LibrabySliderItem(
                            isRawIcon: false,
                            icon: CupertinoIcons.music_mic,
                            colors: [Colors.orangeAccent, Colors.redAccent],
                            title: "Karaoke",
                          ),
                          LibrabySliderItem(
                            isRawIcon: true,
                            icon: Icons.broadcast_on_home,
                            colors: [Colors.greenAccent, Colors.green],
                            title: "Podcast",
                          ),
                          LibrabySliderItem(
                            isRawIcon: true,
                            icon: Icons.ondemand_video,
                            colors: [Colors.blue, Colors.blueAccent],
                            title: "MV",
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          LibrabySliderItem(
                            isRawIcon: false,
                            icon: Icons.arrow_downward,
                            colors: [Colors.purpleAccent, Colors.purple],
                            title: "Trên thiết bị",
                            count: 50,
                          ),
                          LibrabySliderItem(
                            isRawIcon: true,
                            icon: CupertinoIcons.person_fill,
                            colors: [Colors.yellowAccent, Colors.orange],
                            title: "Nghệ sĩ",
                            count: 50,
                          ),
                          LibrabySliderItem(
                            isRawIcon: true,
                            icon: Icons.cloud_upload,
                            colors: [Colors.orangeAccent, Colors.redAccent],
                            title: "Trên thiết bị",
                            count: 50,
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: LibraryNavbar(),
        )
      ],
    );
  }
}
