import 'package:flutter/material.dart';

class LibraryNavbar extends StatelessWidget {
  const LibraryNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Playlist",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: 20,
            ),
            Text("Album", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              width: 20,
            ),
            Text("Gần đây", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Icon(Icons.more_vert),
        )
      ],
    );
  }
}
