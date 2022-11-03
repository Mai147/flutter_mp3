import 'package:flutter/material.dart';

class BottomModalItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? clickEvent;
  final bool isLast;
  final bool isActive;

  const BottomModalItem(
      {required this.title,
      required this.icon,
      this.clickEvent,
      this.isLast = false,
      this.isActive = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: clickEvent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
              ),
              isActive ? const Icon(Icons.check) : Container()
            ],
          ),
        ),
        !isLast
            ? const SizedBox(
                height: 30,
              )
            : Container()
      ],
    );
  }
}
