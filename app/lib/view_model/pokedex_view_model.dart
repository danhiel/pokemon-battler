import 'package:app/model/pokemon_model.dart';
import 'package:app/repos/pokemon_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class PokedexViewModel extends ChangeNotifier {
  late PokemonRepository _pokemonRepo;
  List<Pokemon> _pokedex = [];
  Pokemon? _selectedPokemon;

  PokedexViewModel() {
    _pokemonRepo = GetIt.instance.get<PokemonRepository>();
    watchPokedex();
  }

  void watchPokedex() {
    _pokemonRepo.watchAllPokemons().listen((pokemons) {
      _pokedex = pokemons;
      notifyListeners();
    });
  }

  List<Pokemon> getAllPokemon() {
    return _pokedex;
  }

  Pokemon? getPokemon(int index) {
    if (index < 0 && index >= _pokedex.length) {
      return null;
    }
    return _pokedex[index];
  }

  void insertPokemon(Pokemon pokemon) {
    _pokemonRepo.insertPokemon(pokemon);
  }

  Pokemon? get selectedPokemon => _selectedPokemon;

  set selectedPokemon(Pokemon? pkm) {
    if (pkm != null) {
      var pokemon = _pokedex.firstWhere((p) => p.shortName == pkm.shortName);
      if (pokemon.isCaptured) {
        _selectedPokemon = pkm;
      }
    }
  }
}
