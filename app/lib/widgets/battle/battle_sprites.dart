import 'package:flutter/material.dart';

class BattleSprites extends StatelessWidget {
  final String spriteImg;
  final bool isOpponent;

  const BattleSprites(
      {super.key, required this.spriteImg, required this.isOpponent});

  @override
  Widget build(BuildContext context) {
    if (isOpponent) {
      return Positioned(
          right: 40.0,
          top: 225.0,
          child: Image(
              image: AssetImage(spriteImg), fit: BoxFit.cover, height: 150));
    } else {
      return Positioned(
          left: 175.0,
          bottom: 250.0,
          child: Transform(
              transform: Matrix4.rotationY(3.14),
              child: Image(
                  image: AssetImage(spriteImg),
                  fit: BoxFit.cover,
                  height: 150)));
    }
  }
}
