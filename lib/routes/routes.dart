import 'package:flutter/material.dart';
import 'package:flutter_mp3/pages/describe_page.dart';
import 'package:flutter_mp3/pages/discovery_page.dart';
import 'package:flutter_mp3/pages/library_device_song_page.dart';
import 'package:flutter_mp3/pages/library_page.dart';
import 'package:flutter_mp3/pages/radio_page.dart';
import 'package:flutter_mp3/pages/search_page.dart';
import 'package:flutter_mp3/pages/setting_page.dart';
import 'package:flutter_mp3/pages/song_page.dart';
import 'package:flutter_mp3/pages/splash_page.dart';
import 'package:flutter_mp3/pages/krchart_page.dart';

import '../models/SongModel.dart';

final routes = {
  '/': (context) => const SpalshPage(),
  '/library': (context) => const LibraryPage(),
  '/discovery': (context) => const DiscoveryPage(),
  '/krchart': (context) => const KrChartPage(),
  '/radio': (context) => const RadioPage(),
  '/describe': (context) => const DescribePage(),
  '/library/device': (context) => const LibraryDeviceSongPage(),
  '/search': (context) => const SearchPage(),
  '/song': (context) =>
      SongPage(song: ModalRoute.of(context)!.settings.arguments as SongModel),
  '/setting': (context) => const SettingPage(),
};
