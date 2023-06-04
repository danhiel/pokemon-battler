import 'package:app/view_models/battle_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'battle_actions.dart';
import 'battle_bar_info.dart';
import 'battle_sprites.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final battleViewModel = context.watch<BattleViewModel>();

    if (battleViewModel.opponentInfo.currentHp! <= 0 ||
        battleViewModel.userInfo.currentHp! <= 0) {
      context.pop();
    }

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/battle-background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          BattleSprites(
              spriteImg: battleViewModel.opponentInfo.sprite, isOpponent: true),
          BattleSprites(
              spriteImg: battleViewModel.userInfo.sprite, isOpponent: false),
          Column(
            children: [
              Expanded(
                  flex: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: BattleBarInfo(
                            pokemonDetails: battleViewModel.opponentInfo),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: BattleBarInfo(
                            pokemonDetails: battleViewModel.userInfo),
                      )
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: BattleActions(
                    moves: battleViewModel.userInfo.moves,
                    playMove: battleViewModel.playMove,
                    isLoading: battleViewModel.isLoading,
                    dialogue: battleViewModel.dialogue,
                  )),
            ],
          ),
        ]));
  }
}
