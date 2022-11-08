import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal_item.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';

class LibraryDeviceModal extends StatelessWidget {
  final SongModel song;

  const LibraryDeviceModal({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor))),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(song.image ?? Default.noImageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.name!,
                      style: Theme.of(context).textTheme.displayMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      song.artist ?? Default.songArtist,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BottomModalItem(
            title: "Xoá khỏi thư viện", icon: CupertinoIcons.heart_slash),
        BottomModalItem(title: "Thêm vào thư viện", icon: Icons.playlist_add),
        BottomModalItem(title: "Thêm vào danh sách phát", icon: Icons.add),
        BottomModalItem(
            title: "Tải về", icon: Icons.download_for_offline_outlined),
        BottomModalItem(
          title: "Xóa file đã tải",
          icon: Icons.delete_outline,
          isLast: true,
        ),
      ],
    );
  }
}
