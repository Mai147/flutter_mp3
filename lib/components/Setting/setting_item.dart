import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? clickEvent;

  const SettingItem(
      {required this.icon, required this.title, this.clickEvent, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickEvent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
            const Icon(
              Icons.chevron_right_outlined,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
