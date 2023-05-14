import 'package:app/model/pokemon_model.dart';
import 'package:app/widgets/pokedex/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

List<Pokemon> _pokemonList = <Pokemon>[
  Pokemon(
      "1",
      "Charmander",
      "CH",
      "type",
      "weakness",
      "description",
      100,
      100,
      "",
      "assets/pokemons/charmander.jpg",
      "assets/pokemons/charmander.jpg",
      "typeIcon",
      "weaknessIcon",
      false),
  Pokemon(
      "2",
      "Bulbasaur",
      "BU",
      "type",
      "weakness",
      "description",
      100,
      100,
      "",
      "assets/pokemons/bulbasaur.jpg",
      "assets/pokemons/bulbasaur.jpg",
      "typeIcon",
      "weaknessIcon",
      false),
  Pokemon(
      "3",
      "Squirtle",
      "SQ",
      "type",
      "weakness",
      "description",
      100,
      100,
      "",
      "assets/pokemons/squirtle.jpg",
      "assets/pokemons/squirtle.jpg",
      "typeIcon",
      "weaknessIcon",
      false),
];

class PickStarterPokemon extends StatefulWidget {
  const PickStarterPokemon({super.key});

  @override
  State<PickStarterPokemon> createState() => _PickStarterPokemon();
}

class _PickStarterPokemon extends State<PickStarterPokemon> {
  String _selectedPokemon = _pokemonList[0].id;

  _onSelectPokemon() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
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
                          _selectedPokemon = _pokemonList[index].id;
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
                                  color: _selectedPokemon == pokemon.id
                                      ? Colors.blueAccent
                                      : Colors.grey,
                                  width: _selectedPokemon == pokemon.id
                                      ? 5.0
                                      : 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: PokemonCard(pokemon: pokemon)),
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ElevatedButton(
                      onPressed: _onSelectPokemon,
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
