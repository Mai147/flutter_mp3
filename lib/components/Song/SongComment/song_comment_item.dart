import 'package:flutter/material.dart';

class SongCommentItem extends StatelessWidget {
  const SongCommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 207, 213, 227),
                    borderRadius: BorderRadius.circular(100)),
                child: const Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kuro",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text("Bài hát hay quá",
                      style: Theme.of(context).textTheme.displayMedium),
                  const SizedBox(
                    height: 6,
                  ),
                  Text("3 ngày trước",
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              )
            ],
          ),
          const Icon(
            Icons.favorite,
            size: 16,
          )
        ],
      ),
      const SizedBox(
        height: 20,
      )
    ]);
  }
}
