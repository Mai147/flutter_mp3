import 'dart:async';

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final Function(String value) searchFunc;
  final bool isFocus;
  const Search({required this.searchFunc, this.isFocus = true, super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSearching = false;
  String searchValue = "";
  int isOn = 0;

  Timer? _debounce;

  TextEditingController searchController = TextEditingController();

  void search(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        searchValue = value;
      });
      widget.searchFunc(searchValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isSearching = hasFocus;
        });
      },
      child: SizedBox(
        height: 36,
        child: TextField(
          controller: searchController,
          autofocus: widget.isFocus,
          onChanged: (value) {
            search(value);
          },
          style: Theme.of(context).textTheme.displayMedium,
          decoration: InputDecoration(
              isDense: true,
              filled: true,
              hintText: "Tìm kiếm bài hát, nghệ sĩ...",
              hintStyle: Theme.of(context).textTheme.labelMedium,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
              prefixIcon: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.search_rounded,
                  color: Theme.of(context).iconTheme.color,
                  size: 20,
                ),
              ),
              suffixIcon: (isSearching && searchValue != "")
                  ? IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        setState(() {
                          searchValue = "";
                          searchController.text = "";
                        });
                        search(searchValue);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColorDark,
                        size: 20,
                      ),
                    )
                  : null,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
        ),
      ),
    );
  }
}
