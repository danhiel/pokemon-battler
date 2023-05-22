import 'package:flutter/material.dart';

import '../../models/pokemon_move_model.dart';

class BattleMove extends StatelessWidget {
  final Move move;

  const BattleMove({super.key, required this.move});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/icons/${move.type}.jpg'),
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 6),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              move.name,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            Text(
              move.dp?.toString() ?? '0',
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ],
    );
  }
}
