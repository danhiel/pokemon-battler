import 'package:app/models/pokemon_details_model.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final PokemonDetails pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          pokemon.photo,
          width: 150,
          height: 150,
        ),
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
