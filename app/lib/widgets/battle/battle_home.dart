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
  handleClickViewDetails(String name) =>
      context.pushNamed('pokemonDetails', queryParameters: {'name': name});

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
                child: Container(
              margin: const EdgeInsets.only(top: 200, left: 32, right: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 12,
                    offset: Offset(2, 2), // Shadow position
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () => handleClickBattle(),
                      child: const Text('Battle')),
                  ElevatedButton(
                      onPressed: () =>
                          handleClickViewDetails(selectedPokemon.shortName),
                      child: Text('View ${selectedPokemon.name} Details')),
                ],
              ),
            )),
            const SizedBox(height: 150),
            Image.asset('assets/sprites/${selectedPokemon.shortName}.png',
                fit: BoxFit.cover, height: 200),
          ],
        ));
  }
}
