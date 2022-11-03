import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  final bool condition;

  const Loading({required this.condition, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: condition
            ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 3 / 4,
                color: Color.fromARGB(100, 0, 0, 0),
                child: Center(
                    child: LoadingAnimationWidget.discreteCircle(
                        color: Theme.of(context).primaryColor, size: 40)),
              )
            : Container());
  }
}
