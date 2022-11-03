import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/Library/LibraryNavbar/library_navbar_item.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal_item.dart';

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
            var modal = BottomModal(
                context: context,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const BottomModalItem(
                    icon: Icons.search,
                    title: "Tìm kiếm playlist",
                  ),
                  BottomModalItem(
                      icon: Icons.filter_alt_outlined,
                      title: "Lọc và sắp xếp",
                      isLast: true,
                      clickEvent: () {
                        var modal2 = BottomModal(
                            context: context,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lọc theo",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const BottomModalItem(
                                      title: "Đã tải",
                                      icon: Icons.arrow_circle_down),
                                  const BottomModalItem(
                                      title: "Của tôi",
                                      icon: Icons.library_music),
                                  Text(
                                    "Sắp xếp theo",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const BottomModalItem(
                                    title: "Thời gian thêm vào (Mới nhất)",
                                    icon: Icons.keyboard_arrow_up,
                                    isActive: true,
                                  ),
                                  const BottomModalItem(
                                      title: "Thời gian thêm vào (Cũ nhất)",
                                      icon: Icons.keyboard_arrow_down),
                                  const BottomModalItem(
                                      title: "Tên (A-Z)",
                                      icon: CupertinoIcons.sort_up),
                                  const BottomModalItem(
                                      title: "Tên (Z-A)",
                                      icon: CupertinoIcons.sort_down),
                                ],
                              ),
                            ));
                        modal2.initModal();
                      })
                ]));
            modal.initModal();
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
