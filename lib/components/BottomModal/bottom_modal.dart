import 'package:flutter/material.dart';

class BottomModal {
  final BuildContext context;
  final Widget child;

  BottomModal({required this.context, required this.child});

  initModal() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        builder: (BuildContext context) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: child);
        });
  }

  initFullScreenModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        builder: (BuildContext context) {
          return FractionallySizedBox(
            heightFactor: 0.95,
            child: child,
          );
        });
  }
}
