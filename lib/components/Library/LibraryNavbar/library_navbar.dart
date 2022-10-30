import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Library/LibraryNavbar/library_navbar_item.dart';
import 'package:flutter_mp3/components/Library/LibraryNavbar/library_navbar_modal_item.dart';

class LibraryNavbar extends StatelessWidget {
  const LibraryNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            LibraryNavbarItem(
              title: "Playlist",
              isActive: true,
            ),
            LibraryNavbarItem(
              title: "Album",
            ),
            LibraryNavbarItem(
              title: "Gần đây",
            )
          ],
        ),
        IconButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Theme.of(context).bottomAppBarColor,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child:
                        Column(mainAxisSize: MainAxisSize.min, children: const [
                      LibraryNavbarModalItem(
                        icon: Icons.search,
                        title: "Tìm kiếm playlist",
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      LibraryNavbarModalItem(
                        icon: Icons.filter_alt_outlined,
                        title: "Lọc và sắp xếp",
                      ),
                    ]),
                  );
                });
          },
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).primaryColorDark,
          ),
        )
      ],
    );
  }
}
