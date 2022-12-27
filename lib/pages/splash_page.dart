import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/database_provider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:flutter_mp3/provider/theme_provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var audioProvider = Provider.of<AudioProvider>(context, listen: false);
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    var songProvider = Provider.of<SongProvider>(context, listen: false);

    requestPermission();

    final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      if (themeProvider.modeName == "device") {
        themeProvider.changeByDeviceMode();
      }
    };

    Future.delayed(const Duration(seconds: 3), () async {
      await audioProvider.initPage();
      await DBProvider.db.initDB();
      await songProvider.getListDeviceSong();
      // var root = await getExternalStorageDirectory();
      // var fm = FileManager(root: root);
      // var files = await fm.filesTree(
      //     excludedPaths: ["/storage/emulated/0/Android"],
      //     extensions: ["png"] //optional, to filter files, list only mp3 files
      //     );
      // files.forEach((element) {
      //   print(element.path);
      // });
      // await audioProvider.audioPlayer.setFilePath(files[0].path);
      // await audioProvider.audioPlayer.play();
      if (!mounted) {
        return;
      }
      Navigator.pushReplacementNamed(context, '/library');
    });
  }

  void requestPermission() {
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText("KuroRice",
                    textStyle:
                        TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    colors: [
                      ColorsConstant.darkPrimaryColor,
                      ColorsConstant.subPrimaryColor,
                      Theme.of(context).primaryColorLight,
                      ColorsConstant.darkPrimaryColor,
                    ],
                    speed: const Duration(milliseconds: 400))
              ],
              totalRepeatCount: 1,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText("MP3",
                    textStyle: const TextStyle(fontSize: 40),
                    speed: const Duration(milliseconds: 200))
              ],
              totalRepeatCount: 1,
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //     body: Center(
    //   child: LoadingAnimationWidget.discreteCircle(
    //     color: Theme.of(context).primaryColor,
    //     size: 150,
    //   ),
    // ));
  }
}
