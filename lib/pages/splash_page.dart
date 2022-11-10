import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/theme_provider.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
    var audioProvider = Provider.of<AudioProvider>(context, listen: false);
    var themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    final window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      if (themeProvider.modeName == "device") {
        themeProvider.changeByDeviceMode();
      }
    };

    Future.delayed(Duration(seconds: 3), () async {
      await audioProvider.audioPlayer.setAudioSource(AudioSource.uri(
          Uri.parse(
              "asset:///assets/audio/${audioProvider.getActiveSong().audio}"),
          tag: MediaItem(
              id: audioProvider.getActiveSong().id!,
              title: audioProvider.getActiveSong().name!,
              artist: audioProvider.getActiveSong().artist)));
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
  //   var audioProvider = Provider.of<AudioProvider>(context, listen: false);
  //   audioProvider.audioPlayer.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoadingAnimationWidget.discreteCircle(
        color: Theme.of(context).primaryColor,
        size: 150,
      ),
    ));
  }
}
