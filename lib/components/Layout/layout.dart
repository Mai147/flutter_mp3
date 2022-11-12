import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Audio/audio.dart';
import 'package:flutter_mp3/components/Layout/BottomNavbar/bottom_navbar.dart';
import 'package:flutter_mp3/components/Layout/TopNavbar/Search/search_appbar.dart';
import 'package:flutter_mp3/components/Layout/TopNavbar/top_navbar.dart';
import 'package:flutter_mp3/components/Modal/error_modal.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final bool hasTopNav;
  final bool hasAppBar;
  final bool isSearchPage;
  final String appBarTitle;

  const Layout(
      {required this.child,
      this.hasTopNav = true,
      this.hasAppBar = false,
      this.isSearchPage = false,
      this.appBarTitle = "",
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hasAppBar
            ? isSearchPage
                ? SearchAppbar()
                : AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    title: Text(
                      appBarTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    backgroundColor: Theme.of(context).bottomAppBarColor,
                  )
            : null,
        body: SafeArea(
          child: Stack(children: [
            !isSearchPage
                ? SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hasTopNav ? const TopNavbar() : Container(),
                      const Audio(),
                      child
                    ],
                  ))
                : Container(
                    child: child,
                  ),
            const ErrorModal()
          ]),
        ),
        bottomNavigationBar: const BottomNavbar());
  }
}
