import 'package:app/database/database.dart';
import 'package:app/database/pokemon_entity.dart';
import 'package:flutter/widgets.dart';

class PokedexViewModel extends ChangeNotifier {
  final PokedexDatabase _database;
  List<Pokemon> _pokedex = [];
  Pokemon? _selectedPokemon;

  PokedexViewModel(this._database) {
    watchPokedex();
  }

  void watchPokedex() async {
    _pokedex = await _database.pokemonDao.getAllPokemons();
    _database.pokemonDao.watchAllPokemons().listen((pokemons) {
      _pokedex = pokemons;
      notifyListeners();
    });
    _selectedPokemon = await _database.pokemonDao.getSelectedPokemon();
  }

  List<Pokemon> get allPokemons => _pokedex;

  List<Pokemon> get allCapturedPokemons =>
      _pokedex.where((pokemon) => pokemon.captured).toList();

  Pokemon? get selectedPokemon => _selectedPokemon;

  Pokemon? getPokemonByShortName(String shortName) =>
      _pokedex.firstWhere((pkm) => pkm.shortName == shortName);

  Future<void> setSelectedPokemon({Pokemon? pokemon, String? shortName}) async {
    var newPokemon = _getPokemonToUpdate(pokemon, shortName);

    var selected = selectedPokemon;
    if (selected != null) {
      selected.selected = false;
      await _database.pokemonDao.updatePokemon(selected);
    }
    newPokemon.selected = true;
    newPokemon.captured = true;
    await _database.pokemonDao.updatePokemon(newPokemon);
    _selectedPokemon = newPokemon;
  }

  Future<void> setCapturedPokemon(
      {required bool isCaptured, Pokemon? pokemon, String? shortName}) async {
    var newPokemon = _getPokemonToUpdate(pokemon, shortName);

    newPokemon.captured = isCaptured;
    if (isCaptured == false) {
      newPokemon.selected = false;
    }
    await _database.pokemonDao.updatePokemon(newPokemon);
  }

  Future<void> insertPokemon(Pokemon pokemon) async {
    await _database.pokemonDao.insertPokemon(pokemon);
  }

  Pokemon _getPokemonToUpdate(Pokemon? pokemon, String? shortName) {
    if (pokemon == null && shortName == null) {
      throw "Atleast one parameter required";
    }
    return pokemon ?? _pokedex.firstWhere((pkm) => pkm.shortName == shortName);
  }

  Future<void> reset() async {
    for (var pokemon in _pokedex) {
      await setCapturedPokemon(isCaptured: false, shortName: pokemon.shortName);
    }
    _selectedPokemon = null;
  }
}
