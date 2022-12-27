import 'package:flutter/material.dart';

class AlbumItem extends StatelessWidget {
  final String image;
  final String title;
  final String? description;
  const AlbumItem(
      {super.key, required this.image, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 9 / 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 9 / 25,
                height: size.width * 9 / 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/images/songs/$image"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '$title\n',
                style: Theme.of(context).textTheme.displayMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 8,
              ),
              description != null
                  ? Text(
                      description!,
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Container(),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
