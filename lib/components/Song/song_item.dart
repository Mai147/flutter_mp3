import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/pages/song_page.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/modal_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class SongItem extends StatelessWidget {
  final SongModel song;
  final bool canClick;
  final bool canSwipe;
  final bool canOpenModal;
  const SongItem(
      {required this.song,
      this.canClick = true,
      this.canSwipe = false,
      this.canOpenModal = true,
      super.key});

  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return Column(
      children: [
        canSwipe
            ? Slidable(
                key: Key(song.id!),
                endActionPane: ActionPane(
                  // A motion is a widget used to control how the pane animates.
                  motion: const ScrollMotion(),
                  // All actions are defined in the children parameter.
                  children: [
                    // A SlidableAction can have an icon and/or a label.
                    SlidableAction(
                      onPressed: (context) {
                        var rs = audioProvider.removeSong(song);
                        if (!rs) {
                          Provider.of<ModalProvider>(context, listen: false)
                              .openModal("Bài hát này hiện đang được phát.");
                        }
                      },
                      backgroundColor: ColorsConstant.errorColor,
                      foregroundColor: ColorsConstant.whiteColor,
                      icon: Icons.delete,
                      label: 'Xóa',
                    ),
                  ],
                ),
                child: buildItem(context),
              )
            : buildItem(context),
        const SizedBox(
          height: 16,
        )
      ],
    );
    // return buildItem(context);
  }

  buildItem(BuildContext context) {
    var audioProvider = Provider.of<AudioProvider>(context);
    return InkWell(
      onTap: (canClick && canOpenModal)
          ? () {
              var modal =
                  BottomModal(context: context, child: SongPage(song: song));
              modal.initFullScreenModal();
            }
          : (canClick)
              ? () async {
                  await audioProvider.initAudioPLayer(song);
                }
              : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
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
            width: 30,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.playlist_add),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints())
            ],
          )
        ],
      ),
    );
  }
}
