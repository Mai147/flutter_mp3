import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Library/library.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(child: Library());
  }
}
