class Player {
  final String _id;
  final String _pokedex;
  String _selectedPokemon;

  Player(this._id, this._pokedex, this._selectedPokemon);

  String get id => this._id;

  String get pokedex => this._pokedex;

  String get selectedPokemon => this._selectedPokemon;

  set selectedPokemon(String selectedPokemon) {
    _selectedPokemon = selectedPokemon;
  }
}
