import 'package:app/models/pokemon_details_model.dart';
import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String shortName;
  final String displayName;

  const PokemonCard({
    super.key,
    required this.shortName,
    required this.displayName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/$shortName.jpg',
          width: 150,
          height: 150,
        ),
        Column(
          children: [
            Text(
              displayName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
