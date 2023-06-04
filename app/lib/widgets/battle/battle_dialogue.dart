import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BattleDialogue extends StatelessWidget {
  final String dialogue;

  const BattleDialogue({super.key, required this.dialogue});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedTextKit(
              key: ValueKey<String>(dialogue),
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(dialogue,
                    curve: Curves.easeIn,
                    speed: const Duration(milliseconds: 40),
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        decoration: TextDecoration.none))
              ]),
        ));
  }
}
