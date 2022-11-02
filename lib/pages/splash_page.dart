import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:flutter_mp3/provider/theme_provider.dart';
import 'package:provider/provider.dart';

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
    var songProvider = Provider.of<SongProvider>(context, listen: false);
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      if (themeProvider.modeString == "device") {
        themeProvider.changeByDeviceMode();
      }
    };

    Future.delayed(Duration(seconds: 3), () async {
      // await songProvider.setSource(songProvider.getActiveSong());
      await songProvider.audioPlayer
          .setAsset("assets/audio/${songProvider.getActiveSong().url}");
      if (!mounted) {
        return;
      }
      Navigator.pushReplacementNamed(context, '/library');
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   var songProvider = Provider.of<SongProvider>(context, listen: false);
  //   songProvider.audioPlayer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Text("Loading");
  }
}
