import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;

  const BottomNavbarItem(
      {required this.icon,
      required this.label,
      this.isActive = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive
              ? Theme.of(context).primaryColor
              : Theme.of(context).iconTheme.color,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
              color: isActive
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).textTheme.labelSmall!.color),
        )
      ],
    );
  }
}
