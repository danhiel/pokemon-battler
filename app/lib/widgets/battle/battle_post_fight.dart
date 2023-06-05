import 'package:app/models/pokemon_details_model.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:flutter/material.dart';

Future<void> showPostFight(
    BuildContext context,
    Function goHome,
    PokemonDetails opponentInfo,
    PokedexViewModel pokedexViewModel,
    bool captured) async {
  final userWon = opponentInfo.currentHp! <= 0;

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(userWon ? 'Victorious!' : 'Defeated'),
        content: const Image(
            image: AssetImage('assets/images/detective-pikachu.jpg'),
            height: 120,
            width: 120,
            fit: BoxFit.contain),
        actions: [
          if (userWon)
            TextButton(
                onPressed: captured
                    ? null
                    : () async {
                        await pokedexViewModel.setCapturedPokemon(
                            isCaptured: true,
                            shortName: opponentInfo.shortName);
                        if (context.mounted) {
                          Navigator.of(context).pop();
                          goHome();
                        }
                      },
                child: Text(captured ? 'Captured' : 'Capture it!')),
          TextButton(
            child: const Text('Return to home'),
            onPressed: () {
              Navigator.of(context).pop();
              goHome();
            },
          ),
        ],
      );
    },
  );
}
