import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BattleDialogue extends StatelessWidget {
  final String dialogue;

  const BattleDialogue({super.key, required this.dialogue});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
        TypewriterAnimatedText(dialogue,
            curve: Curves.easeIn,
            speed: const Duration(milliseconds: 50),
            textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                decoration: TextDecoration.none))
      ]),
    ));
  }
}
