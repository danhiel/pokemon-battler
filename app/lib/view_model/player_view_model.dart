import 'package:app/model/player_model.dart';
import 'package:app/model/pokemon_model.dart';
import 'package:flutter/widgets.dart';

class PokedexViewModel extends ChangeNotifier {
  final Player _player = Player();

  PokedexViewModel() {}

  void capturePokemon(int index) {
    if (_player.pokedex.containsKey(index)) {
      _player.pokedex[index]?.isCaptured = true;
    }
    notifyListeners();
  }

  void releasePokemon(int index) {
    if (_player.pokedex.containsKey(index)) {
      _player.pokedex[index]?.isCaptured = false;
    }
    notifyListeners();
  }

  Pokemon? getPokemon(int index) {
    if (index < 0 && index >= _player.pokedex.length) {
      return null;
    }
    return _player.pokedex[index];
  }

  int get pokedexCount => _player.pokedex.length;

  Pokemon get selectedPokemon => _player.selectedPokemon;

  set selectedPokemon(Pokemon pkm) => _player.selectedPokemon = pkm;
}
