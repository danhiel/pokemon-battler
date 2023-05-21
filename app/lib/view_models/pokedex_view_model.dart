import 'package:app/database/database.dart';
import 'package:app/database/pokemon_entity.dart';
import 'package:flutter/widgets.dart';

class PokedexViewModel extends ChangeNotifier {
  PokedexDatabase database;
  List<Pokemon> _pokedex = [];
  late Pokemon _selectedPokemon;

  PokedexViewModel(this.database) {
    watchPokedex();
  }

  void watchPokedex() async {
    _pokedex = await database.pokemonDao.getAllPokemons();
    database.pokemonDao.watchAllPokemons().listen((pokemons) {
      _pokedex = pokemons;
      notifyListeners();
    });
    _selectedPokemon = _pokedex.firstWhere((pokemon) => pokemon.selected);
  }

  List<Pokemon> get allPokemons => _pokedex;

  List<Pokemon> get allCapturedPokemons =>
      _pokedex.where((pokemon) => pokemon.captured).toList();

  Pokemon get selectedPokemon => _selectedPokemon;

  void setSelectedPokemon({Pokemon? pokemon, String? shortName}) async {
    var newPokemon = _getPokemonToUpdate(pokemon, shortName);

    selectedPokemon.selected = false;
    newPokemon.selected = true;
    await database.pokemonDao.updatePokemon(selectedPokemon);
    await database.pokemonDao.updatePokemon(newPokemon);
  }

  void setCapturedPokemon(
      {required bool isCaptured, Pokemon? pokemon, String? shortName}) async {
    var newPokemon = _getPokemonToUpdate(pokemon, shortName);

    newPokemon.captured = isCaptured;
    await database.pokemonDao.updatePokemon(newPokemon);
  }

  void insertPokemon(Pokemon pokemon) async {
    await database.pokemonDao.insertPokemon(pokemon);
  }

  Pokemon _getPokemonToUpdate(Pokemon? pokemon, String? shortName) {
    if (pokemon == null && shortName == null) {
      throw "Atleast one parameter required";
    }
    return pokemon ?? _pokedex.firstWhere((pkm) => pkm.shortName == shortName);
  }
}
