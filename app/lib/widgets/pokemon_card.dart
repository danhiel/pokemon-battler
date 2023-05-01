import 'package:flutter/material.dart';
import 'package:app/model/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(pokemon.photo, width: 150, height: 150,),
        Column(
          children: [
            Text(
              pokemon.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Type: ${pokemon.type}",
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ],
    );
  }
}
