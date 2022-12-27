import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Album/album_list.dart';
import 'package:flutter_mp3/components/Discovery/discovery_section.dart';
import 'package:flutter_mp3/components/Discovery/discovery_song.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Song/SongBanner/song_banner.dart';

List<Map<String, String>> listSuggest = [
  {"image": "album1.jpg", "title": "Thanh Âm Indie Buồn"},
  {"image": "album2.jpg", "title": "C-Pop Hot Covers"},
  {"image": "album3.jpg", "title": "Guitar C-Pop"},
];

List<Map<String, String>> listWeekend = [
  {
    "image": "album4.jpg",
    "title": "Đỉnh Cao Trending",
    "description": "Chiếm trọn Top Trending Việt Nam khi vừa ra mắt"
  },
  {
    "image": "album5.jpg",
    "title": "Tâm Tạng Tan Chậm",
    "description": "Đóng băng thời gian, tan chầm chậm theo những cảm xúc"
  },
  {
    "image": "album6.jpg",
    "title": "Đóa Hồng Nhạc Việt",
    "description": "Nữ ca sĩ tỏa sắc hương trong khu vườn V-Pop"
  },
];

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
        child: Column(
      children: [
        const SongBanner(),
        const SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DiscoverySection(
                title: "Có thể bạn muốn nghe",
                child: AlbumList(
                  list: listSuggest,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: DiscoverySection(
                  title: "Mới phát hành",
                  child: SizedBox(height: 320, child: DiscoverySong())),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DiscoverySection(
                title: "Cuối tuần lên nhạc",
                child: AlbumList(
                  list: listWeekend,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )
      ],
    ));
  }
}
