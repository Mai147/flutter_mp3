import 'package:flutter/material.dart';

class DiscoverySection extends StatelessWidget {
  final String title;
  final Widget? child;

  const DiscoverySection({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              width: 6,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Theme.of(context).primaryColorDark,
              size: 18,
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        child ?? Container()
      ],
    );
  }
}
