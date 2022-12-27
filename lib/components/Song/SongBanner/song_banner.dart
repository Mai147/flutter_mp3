import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

List<String> list = [
  "banner1.jpg",
  "banner2.jpg",
  "banner3.jpg",
  "banner4.jpg",
  "banner5.jpg",
];

class SongBanner extends StatelessWidget {
  const SongBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("assets/images/songs/${list[index]}"),
                      fit: BoxFit.fill)),
            ),
          );
        },
        autoplay: true,
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        duration: 1500,
        pagination: const SwiperPagination(
            alignment: Alignment.topRight,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            builder:
                DotSwiperPaginationBuilder(size: 8, activeSize: 8, space: 2)),
      ),
    );
  }
}
