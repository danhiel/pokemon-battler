import 'package:app/models/pokemon_details_model.dart';
import 'package:app/database/pokemon_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class PokedexViewModel extends ChangeNotifier {
  late PokemonRepository _pokemonRepo;
  List<Pokemon> _capturedPokemons = [];
  PokemonDetails? selectedPokemon;

  PokedexViewModel() {
    _pokemonRepo = GetIt.instance.get<PokemonRepository>();
    watchPokedex();
  }

  void watchPokedex() {
    _pokemonRepo.watchAllPokemons().listen((pokemons) {
      _capturedPokemons = pokemons;
      notifyListeners();
    });
  }

  Pokemon? getCapturedPokemonByName(String shortName) {
    try {
      return _capturedPokemons.firstWhere((pkm) => pkm.shortName == shortName);
    } catch (e) {
      return null;
    }
  }

  void insertPokemon(Pokemon pokemon) {
    _pokemonRepo.insertPokemon(pokemon);
  }
}
