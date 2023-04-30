import 'package:app/model/pokemon_model.dart';

class Player {
  final String _id;
  final Map<int, Pokemon> _pokedex;
  Pokemon _selectedPokemon;

  Player(this._id, this._pokedex, this._selectedPokemon);

  String get id => _id;

  Map<int, Pokemon> get pokedex => _pokedex;

  Pokemon get selectedPokemon => _selectedPokemon;

  set selectedPokemon(Pokemon selectedPokemon) {
    _selectedPokemon = selectedPokemon;
  }
}
