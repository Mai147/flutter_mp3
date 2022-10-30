import 'package:flutter/material.dart';

class SettingModalItem extends StatelessWidget {
  final bool isActive;
  final String title;
  final void Function() clickEvent;
  const SettingModalItem(
      {required this.title,
      this.isActive = false,
      required this.clickEvent,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickEvent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            isActive ? Icon(Icons.check) : Container()
          ],
        ),
      ),
    );
  }
}
