import 'package:flutter/material.dart';

class LibrabySliderItem extends StatelessWidget {
  // final Widget icon;
  final bool isRawIcon;
  final IconData icon;
  final List<Color> colors;
  final String title;
  final int? count;

  const LibrabySliderItem(
      {required this.isRawIcon,
      required this.icon,
      required this.colors,
      required this.title,
      this.count,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width / 2,
      height: 110,
      padding: const EdgeInsets.fromLTRB(6, 14, 14, 6),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).backgroundColor,
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 1)
            ]),
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isRawIcon ? buildRawIcon() : buildRoundedIcon(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  count.toString() != "null" ? count.toString() : "",
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildRawIcon() {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
                center: Alignment.topLeft,
                radius: 1.8,
                colors: colors,
                tileMode: TileMode.mirror)
            .createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 40,
      ),
    );
  }

  buildRoundedIcon() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors),
          borderRadius: BorderRadius.circular(100)),
      child: Icon(
        icon,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
