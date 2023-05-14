import 'package:app/model/pokemon_details_model.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:app/utils/config_utils.dart';
import 'package:flutter/widgets.dart';

class PokemonInfoViewModel extends ChangeNotifier {
  static final instance = PokemonInfoViewModel._();
  Map<String, PokemonDetails> _pokedex = {};

  PokemonInfoViewModel._();

  Future<Map<String, PokemonDetails>> initializePokemonInfo() async {
    _pokedex = await fetchPokemonInfo();
    return _pokedex;
  }

  List<String> get allPokemonSprites =>
      _pokedex.values.map((e) => e.sprite).toList();

  bool hasInitializedPokedex() {
    return _pokedex.values.isNotEmpty;
  }

  List<PokemonDetails> getAllPokemon() {
    return _pokedex.values.toList();
  }

  PokemonDetails getPokemon(String name) {
    var pokemon = _pokedex[name];
    if (pokemon != null) {
      return pokemon;
    }
    throw 'No pokemon found';
  }
}
