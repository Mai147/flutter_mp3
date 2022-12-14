import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal_item.dart';
import 'package:flutter_mp3/components/Playlist/playlist_modal.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/constants/default/default.dart';
import 'package:flutter_mp3/models/SongModel.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/modal_provider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SongModal extends StatelessWidget {
  final SongModel song;

  const SongModal({required this.song, super.key});

  @override
  Widget build(BuildContext context) {
    var songProvider = Provider.of<SongProvider>(context);
    var audioProvider = Provider.of<AudioProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 16),
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
                        image: songProvider.getImage(song) as ImageProvider,
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
            title: "Xo?? kh???i th?? vi???n", icon: CupertinoIcons.heart_slash),
        audioProvider.listSong.where((element) => element.id == song.id).isEmpty
            ? BottomModalItem(
                title: "Ph??t ti???p theo",
                icon: Icons.add,
                clickEvent: () async {
                  if (audioProvider.listSong.isNotEmpty) {
                    await audioProvider.addItem(song);
                  } else {
                    await audioProvider.initAudioPLayer(song);
                  }
                },
              )
            : Container(),
        BottomModalItem(
          title: "Th??m v??o playlist",
          icon: Icons.playlist_add,
          clickEvent: () {
            var bottomModal =
                BottomModal(context: context, child: PlaylistModal());
            bottomModal.initModal();
          },
        ),
        FutureBuilder(
            future: songProvider.isDownloaded(song),
            builder: ((context, snapshot) {
              var data = snapshot.data;
              if (songProvider.listDownloading[song] == true) {
                return BottomModalItem(
                  title: "??ang t???i...",
                  icon: Icons.downloading,
                  loading: true,
                  isLast: true,
                  textAnimation: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText("??ang t???i...",
                          textStyle: Theme.of(context).textTheme.displayMedium!,
                          colors: [
                            Theme.of(context).primaryColor,
                            ColorsConstant.subPrimaryColor,
                            Theme.of(context).primaryColorDark
                          ],
                          speed: Duration(milliseconds: 300)),
                    ],
                    repeatForever: true,
                  ),
                );
              }
              if (data != null && data == true) {
                return BottomModalItem(
                  title: "X??a file ???? t???i",
                  icon: Icons.delete_outline,
                  isLast: true,
                  clickEvent: () async {
                    if (audioProvider.isInList(song)) {
                      var rs = audioProvider.removeSong(song);
                      if (!rs) {
                        Navigator.pop(context);
                        Provider.of<ModalProvider>(context, listen: false)
                            .openModal("B??i h??t n??y hi???n ??ang ???????c ph??t.");
                      } else {
                        await songProvider.removeSongOutOfDevice(song);
                      }
                    } else {
                      await songProvider.removeSongOutOfDevice(song);
                    }
                  },
                );
              }
              return BottomModalItem(
                title: "T???i v???",
                icon: Icons.download_for_offline_outlined,
                isLast: true,
                clickEvent: () async {
                  await songProvider.saveSongToDevice(song);
                },
              );
            }))
      ],
    );
  }
}
