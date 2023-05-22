import 'package:app/models/pokemon_details_model.dart';
import 'package:app/widgets/pokemon_details/pokemon_detail_moves.dart';
import 'package:flutter/cupertino.dart';

import '../../models/pokemon_move_model.dart';

class PokemonDetailInfoScreen extends StatelessWidget {
  final PokemonDetails pokemon;
  const PokemonDetailInfoScreen({super.key, required this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                    pokemon.name,
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold
                    )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/${pokemon.shortName}.jpg',
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text('Description: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 8,),
                      Expanded(
                        child: Text(pokemon.description, style: const TextStyle(fontSize: 16),),
                      ),
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text('Short Name: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 8,),
                      Text(pokemon.shortName, style: const TextStyle(fontSize: 16),),
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text('Type: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 8,),
                      Text(pokemon.type, style: const TextStyle(fontSize: 16),),
                      const SizedBox(width: 50,),
                      const Text('HP: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 8,),
                      Text(pokemon.hp.toString(), style: const TextStyle(fontSize: 16),),
                    ],
                  )
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const Text('Weakness: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      const SizedBox(width: 10,),
                      Image.asset(pokemon.weaknessIcon),
                    ],
                  )
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Moves: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    PokemonDetailMovesScreen(moves: pokemon.moves,)
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}