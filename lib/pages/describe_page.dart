import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Album/album_list.dart';
import 'package:flutter_mp3/components/Discovery/discovery_section.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';

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

class DescribePage extends StatelessWidget {
  const DescribePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: DiscoverySection(
              title: "Khám phá PodCast",
              child: AlbumList(
                list: listSuggest,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DiscoverySection(
                title: "Đón nghe",
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/songs/radio1.jpg"),
                        fit: BoxFit.cover),
                  ),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: DiscoverySection(
              title: "Kiến thức",
              child: AlbumList(
                list: listSuggest,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: DiscoverySection(
              title: "Văn hóa xã hội",
              child: AlbumList(
                list: listWeekend,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: DiscoverySection(
              title: "Chương trình mới",
              child: AlbumList(
                list: listSuggest,
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
