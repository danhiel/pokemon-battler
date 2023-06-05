import 'package:flutter/material.dart';

class BattleSprites extends StatefulWidget {
  final String spriteImg;
  final String dialogue;
  final String pokemon;
  final bool isOpponent;

  const BattleSprites(
      {super.key,
      required this.spriteImg,
      required this.isOpponent,
      required this.dialogue,
      required this.pokemon});

  @override
  State<BattleSprites> createState() => BattleSpritesState();
}

class BattleSpritesState extends State<BattleSprites> {
  double movement = 0;

  _calculateMovement() {
    if (widget.dialogue.startsWith('${widget.pokemon} used')) {
      setState(() {
        movement = 40;
      });
    } else {
      setState(() {
        movement = 0;
      });
    }
  }

  _renderSprite() {
    return Image(
        image: AssetImage(widget.spriteImg), fit: BoxFit.cover, height: 150);
  }

  @override
  Widget build(BuildContext context) {
    _calculateMovement();
    if (widget.isOpponent) {
      return AnimatedPositioned(
          right: 40 + movement,
          top: 225.0 + movement,
          duration: const Duration(milliseconds: 50),
          child: _renderSprite());
    } else {
      return AnimatedPositioned(
          left: 175.0 + movement,
          bottom: 250.0 + movement,
          duration: const Duration(milliseconds: 50),
          child: Transform(
              transform: Matrix4.rotationY(3.14), child: _renderSprite()));
    }
  }
}
