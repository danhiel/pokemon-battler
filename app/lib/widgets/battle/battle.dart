import 'package:app/widgets/battle/battle_actions.dart';
import 'package:app/widgets/battle/battle_bar_info.dart';
import 'package:flutter/material.dart';

class Battle extends StatelessWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/battle-background.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              const Positioned(
                  right: 40.0,
                  top: 225.0,
                  child: Image(
                      image: AssetImage('assets/sprites/charmander.png'),
                      fit: BoxFit.cover,
                      height: 150)),
              Positioned(
                  left: 175.0,
                  bottom: 250.0,
                  child: Transform(
                      transform: Matrix4.rotationY(3.14),
                      child: const Image(
                          image: AssetImage('assets/sprites/charmander.png'),
                          fit: BoxFit.cover,
                          height: 150))),
              Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Align(
                            alignment: Alignment.topLeft,
                            child: BattleBarInfo(),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: BattleBarInfo(),
                          )
                        ],
                      )),
                  const Expanded(flex: 2, child: BattleActions()),
                ],
              ),
            ])));
  }
}
