import 'package:flutter/material.dart';

import '../../models/pokemon_details_model.dart';

class PokemonDetailsHeader extends StatelessWidget {
  final PokemonDetails pokemon;

  const PokemonDetailsHeader({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: AssetImage(
                    pokemon.typeIcon,
                  ),
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain),
              const Divider(indent: 12),
              Text(pokemon.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          Text('HP: ${pokemon.hp}',
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
