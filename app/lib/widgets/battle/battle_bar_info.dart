import 'package:app/models/pokemon_details_model.dart';
import 'package:app/widgets/battle/battle_health_bar.dart';
import 'package:flutter/material.dart';

import 'battle_decoration.dart';

class BattleBarInfo extends StatelessWidget {
  final PokemonDetails pokemonDetails;

  const BattleBarInfo({super.key, required this.pokemonDetails});

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
            Row(children: [
              Text(
                pokemonDetails.name,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.none),
              ),
              Image(
                image: AssetImage(pokemonDetails.typeIcon),
                height: 16,
                width: 16,
              ),
            ]),
            Row(children: [
              ...List.generate(
                  pokemonDetails.buffs!.length > 5
                      ? 5
                      : pokemonDetails.buffs!.length,
                  (index) => Image(
                        image: AssetImage(
                            'assets/icons/${pokemonDetails.buffs![index]}-buff.png'),
                        height: 16,
                        width: 16,
                      )),
              ...List.generate(
                  pokemonDetails.debuffs!.length > 5
                      ? 5
                      : pokemonDetails.debuffs!.length,
                  (index) => Image(
                        image: AssetImage(
                            'assets/icons/${pokemonDetails.debuffs![index]}-debuff.png'),
                        height: 16,
                        width: 16,
                      )),
            ])
          ]),
          const SizedBox(
            height: 6,
          ),
          HealthBar(
              currentHp: pokemonDetails.currentHp ?? pokemonDetails.hp,
              maxHp: pokemonDetails.hp),
          const SizedBox(
            height: 4,
          ),
          Text(
            '${pokemonDetails.currentHp} / ${pokemonDetails.hp}',
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                decoration: TextDecoration.none),
          )
        ]));
  }
}
