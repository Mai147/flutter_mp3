import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/TopNavbar/Search/search.dart';
import 'package:flutter_mp3/pages/setting_page.dart';

class TopNavbar extends StatelessWidget {
  const TopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset(
          //   "/images/avatar/default_avatar.png",
          //   width: 50,
          //   height: 50,
          // ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 213, 227),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              icon: Icon(Icons.person_rounded),
              color: Colors.white,
              iconSize: 26,
            ),
          ),
          const Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Search(),
          )),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
            constraints: BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.settings_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            iconSize: 30,
          )
        ],
      ),
    );
  }
}
