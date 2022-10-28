import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/bottom_navbar.dart';
import 'package:flutter_mp3/components/Layout/TopNavbar/top_navbar.dart';

class Layout extends StatelessWidget {
  final Widget child;

  const Layout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const TopNavbar(), child],
            ),
          )),
        ),
        bottomNavigationBar: const BottomNavbar());
  }
}
