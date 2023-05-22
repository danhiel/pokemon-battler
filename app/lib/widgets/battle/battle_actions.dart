import 'package:app/models/battle_info_model.dart';
import 'package:app/models/pokemon_move_model.dart';
import 'package:app/widgets/battle/battle_decoration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BattleActions extends StatelessWidget {
  final List<Move> moves;
  final Function playMove;

  const BattleActions({super.key, required this.moves, required this.playMove});

  handleMoveClick(String move, BuildContext context) async {
    BattleInfo battleInfo = await playMove(move);
    print(battleInfo.results);
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: getBattleDecorations(),
        child: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: Colors.black),
              onPressed: () => handleMoveClick('flee', context),
              child: const Text('Flee'),
            ),
            const VerticalDivider(
              color: Colors.black,
            ),
            Flexible(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 2.5,
                  children: List.generate(4, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: const TextStyle(fontSize: 14),
                      ),
                    );
                  })),
            )
          ],
        ));
  }
}
