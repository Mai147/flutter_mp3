import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Layout/TopNavbar/Search/search.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  SearchAppbar({Key? key})
      : preferredSize = Size.fromHeight(50),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      title: Search(),
      backgroundColor: Theme.of(context).bottomAppBarColor,
    );
  }
}
