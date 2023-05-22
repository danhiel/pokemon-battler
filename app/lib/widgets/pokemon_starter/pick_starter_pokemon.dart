import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/pokemon_starter/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PickStarterPokemon extends StatefulWidget {
  const PickStarterPokemon({super.key});

  @override
  State<PickStarterPokemon> createState() => _PickStarterPokemon();
}

class _PickStarterPokemon extends State<PickStarterPokemon> {
  final _pokemonList = ['charmander', 'squirtle', 'bulbasaur'];
  int _selectedPokemonIndex = 0;

  _onSelectPokemon(PokedexViewModel pokedexViewModel) {
    final selectedPokemon = _pokemonList[_selectedPokemonIndex];
    pokedexViewModel.setSelectedPokemon(shortName: selectedPokemon);
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final pokedexViewModel = context.watch<PokedexViewModel>();

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            height: double.infinity, // Give the image a fixed height
            width: double.infinity, // Give the image a fixed width
            fit: BoxFit.cover, // Set the image to cover the entire container
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      height: 215.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _selectedPokemonIndex = index;
                        });
                      }),
                  items: _pokemonList.map((pokemon) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: _pokemonList[_selectedPokemonIndex] ==
                                          pokemon
                                      ? Colors.blueAccent
                                      : Colors.grey,
                                  width: _pokemonList[_selectedPokemonIndex] ==
                                          pokemon
                                      ? 5.0
                                      : 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: PokemonCard(
                                  shortName: pokemon,
                                  displayName: pokedexViewModel
                                          .getPokemonByShortName(pokemon)
                                          ?.name ??
                                      pokemon)),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                      onPressed: () => _onSelectPokemon(pokedexViewModel),
                      child: const Text("Select Pokemon")),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
