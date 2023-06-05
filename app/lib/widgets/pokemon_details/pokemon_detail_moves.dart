import 'package:flutter/material.dart';
import '../../models/pokemon_move_model.dart';

class PokemonDetailMovesScreen extends StatelessWidget {
  final List<Move> moves;

  const PokemonDetailMovesScreen({super.key, required this.moves});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Moves: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // to disable ListView's scrolling
              itemCount: moves.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    moves[index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  leading: Image(
                      image: AssetImage(
                        'assets/icons/${moves[index].type}.jpg',
                      ),
                      height: 32,
                      width: 32,
                      fit: BoxFit.contain),
                  trailing: Text('${moves[index].dp ?? 0} DP',
                      style: const TextStyle(fontSize: 16)),
                );
              })
        ],
      ),
    );
  }
}
