import 'package:flutter/material.dart';

class SearchInit extends StatefulWidget {
  const SearchInit({super.key});

  @override
  State<SearchInit> createState() => _SearchInitState();
}

class _SearchInitState extends State<SearchInit> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: TextField(
        onTap: () {
          Navigator.pushNamed(context, '/search');
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
            fillColor: Theme.of(context).backgroundColor,
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 20, 0)),
      ),
    );
  }
}
