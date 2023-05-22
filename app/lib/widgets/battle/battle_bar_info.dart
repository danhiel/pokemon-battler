import 'package:flutter/material.dart';

import 'battle_decoration.dart';

class BattleBarInfo extends StatelessWidget {
  const BattleBarInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            bottom: 8.0, right: 8.0, left: 8.0, top: 24.0),
        padding: const EdgeInsets.all(6.0),
        alignment: Alignment.topLeft,
        height: 75,
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: getBattleDecorations(),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: const [
              Text(
                'Pikachu',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              Image(
                image: AssetImage('assets/icons/fire.jpg'),
                height: 16,
                width: 16,
              ),
            ]),
            Row(
              children: const [
                Image(
                  image: AssetImage('assets/icons/attack-buff.png'),
                  height: 16,
                  width: 16,
                ),
                Image(
                  image: AssetImage('assets/icons/attack-buff.png'),
                  height: 16,
                  width: 16,
                )
              ],
            )
          ]),
          const SizedBox(
            height: 6,
          ),
          const LinearProgressIndicator(
            color: Colors.green,
            minHeight: 8,
            value: 1.0,
            semanticsLabel: 'Health Bar',
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            '140 / 160',
            style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none),
          )
        ]));
  }
}
