import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BottomModalItem extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? prefix;
  final void Function()? clickEvent;
  final bool isLast;
  final bool isActive;
  final bool loading;
  final double margin;
  final AnimatedTextKit? textAnimation;

  const BottomModalItem(
      {required this.title,
      this.icon,
      this.prefix,
      this.clickEvent,
      this.isLast = false,
      this.isActive = false,
      this.loading = false,
      this.margin = 16,
      this.textAnimation,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: clickEvent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    loading
                        ? LoadingAnimationWidget.discreteCircle(
                            color: Theme.of(context).primaryColor,
                            secondRingColor: ColorsConstant.subPrimaryColor,
                            thirdRingColor: Theme.of(context).primaryColorDark,
                            size: 20)
                        : icon != null
                            ? Icon(
                                icon,
                                color: Theme.of(context).primaryColorDark,
                              )
                            : prefix != null
                                ? prefix!
                                : Container(),
                    const SizedBox(
                      width: 16,
                    ),
                    textAnimation == null
                        ? Text(
                            title,
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        : textAnimation!
                  ],
                ),
                isActive ? const Icon(Icons.check) : Container()
              ],
            ),
          ),
        ),
        !isLast
            ? SizedBox(
                height: margin,
              )
            : Container()
      ],
    );
  }
}
