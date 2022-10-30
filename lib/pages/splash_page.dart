import 'package:flutter/material.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   var songProvider = Provider.of<SongProvider>(context, listen: false);
  //   songProvider.listenPositionAndDuration((duration) { }, (position) { })

  // }

  @override
  Widget build(BuildContext context) {
    return Text("Loading");
  }
}
