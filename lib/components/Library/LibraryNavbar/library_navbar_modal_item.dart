import 'package:flutter/material.dart';

class LibraryNavbarModalItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const LibraryNavbarModalItem(
      {required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColorDark,
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        )
      ],
    );
  }
}
