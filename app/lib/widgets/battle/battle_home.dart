import 'package:app/view_models/pokedex_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartBattle extends StatefulWidget {
  const StartBattle({super.key});

  @override
  State<StartBattle> createState() => _StartBattleState();
}

class _StartBattleState extends State<StartBattle> {
  handleClickBattle() => context.push('/battle');

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();
    var selectedPokemon = pokedexViewModel.selectedPokemon!;

    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () => handleClickBattle(),
                child: const Text('Battle')),
            const SizedBox(height: 150),
            Image.asset('assets/sprites/${selectedPokemon.shortName}.png',
                fit: BoxFit.cover, height: 200),
          ],
        ));
  }
}
