import 'package:app/services/pokemon_service.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/battle/battle_actions.dart';
import 'package:app/widgets/battle/battle_bar_info.dart';
import 'package:app/widgets/battle/battle_sprites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Battle extends StatelessWidget {
  const Battle({super.key});

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    final selectedPokemon = pokedexViewModel.selectedPokemon;

    return SafeArea(
        child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/battle-background.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              const BattleSprites(
                  spriteImg: 'assets/sprites/charmander.png', isOpponent: true),
              const BattleSprites(
                  spriteImg: 'assets/sprites/charmander.png',
                  isOpponent: false),
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
