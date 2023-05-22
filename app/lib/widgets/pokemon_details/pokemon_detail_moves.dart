import 'package:flutter/material.dart';

import '../../models/pokemon_move_model.dart';

class PokemonDetailMovesScreen extends StatelessWidget {
  final List<Move> moves;

  const PokemonDetailMovesScreen({super.key, required this.moves});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
          itemCount: moves.length,
          itemBuilder: (context, index) {
            Move move = moves[index];
            return Text('Move: ${move.name}');
          }
      );
  }
}