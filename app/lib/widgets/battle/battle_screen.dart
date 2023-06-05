import 'package:app/view_models/battle_view_model.dart';
import 'package:app/widgets/battle/battle_post_fight.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../view_models/pokedex_view_model.dart';
import 'battle_actions.dart';
import 'battle_bar_info.dart';
import 'battle_sprites.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => BattleScreenState();
}

class BattleScreenState extends State<BattleScreen> {
  bool postFightMounted = false;

  @override
  Widget build(BuildContext context) {
    final battleViewModel = context.watch<BattleViewModel>();
    final pokedexViewModel = context.watch<PokedexViewModel>();
    final captured = (pokedexViewModel
            .getPokemonByShortName(battleViewModel.opponentInfo.shortName))!
        .captured;

    renderGameOver() async {
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        showPostFight(context, context.pop, battleViewModel.opponentInfo,
            pokedexViewModel, captured);
      }
    }

    if (battleViewModel.gameOver) {
      if (!postFightMounted) {
        setState(() {
          postFightMounted = true;
        });
        renderGameOver();
      }
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
            spriteImg: battleViewModel.opponentInfo.sprite,
            isOpponent: true,
            dialogue: battleViewModel.dialogue,
            pokemon: battleViewModel.opponentInfo.name,
          ),
          BattleSprites(
              spriteImg: battleViewModel.userInfo.sprite,
              isOpponent: false,
              dialogue: battleViewModel.dialogue,
              pokemon: battleViewModel.userInfo.name),
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
                          pokemonDetails: battleViewModel.opponentInfo,
                          captured: captured,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: BattleBarInfo(
                          pokemonDetails: battleViewModel.userInfo,
                          captured: false,
                        ),
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
                      gameOver: battleViewModel.gameOver)),
            ],
          ),
        ]));
  }
}
