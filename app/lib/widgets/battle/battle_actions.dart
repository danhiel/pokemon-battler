import 'package:app/models/battle_info_model.dart';
import 'package:app/models/pokemon_move_model.dart';
import 'package:app/widgets/battle/battle_decoration.dart';
import 'package:app/widgets/battle/battle_move.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/loading_pikachu.dart';

class BattleActions extends StatelessWidget {
  final bool isLoading;
  final List<Move> moves;
  final Function playMove;

  const BattleActions(
      {super.key,
      required this.moves,
      required this.playMove,
      required this.isLoading});

  handleMoveClick(String move, BuildContext context) async {
    await playMove(move);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: getBattleDecorations(),
        child: isLoading
            ? const LoadingPikachu()
            : Row(
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
                        children: List.generate(moves.length, (index) {
                          return GestureDetector(
                              onTap: () =>
                                  handleMoveClick(moves[index].name, context),
                              child: BattleMove(move: moves[index]));
                        })),
                  )
                ],
              ));
  }
}
