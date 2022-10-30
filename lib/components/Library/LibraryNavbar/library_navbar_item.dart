import 'package:flutter/material.dart';

class LibraryNavbarItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const LibraryNavbarItem(
      {required this.title, this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.titleMedium!.fontWeight,
                    color: isActive
                        ? Theme.of(context).textTheme.titleMedium!.color
                        : Theme.of(context).textTheme.labelMedium!.color)),
            const SizedBox(
              height: 2,
            ),
            isActive
                ? Container(
                    width: 30,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Container()
          ],
        ),
        const SizedBox(
          width: 20,
        )
      ],
    );
  }
}
