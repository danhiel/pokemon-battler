import 'package:app/models/pokemon_details_model.dart';
import 'package:app/services/pokemon_service.dart';
import 'package:app/database/database_loader.dart';
import 'package:flutter/widgets.dart';

class PokemonInfoViewModel extends ChangeNotifier {
  static final instance = PokemonInfoViewModel._();
  final List<PokemonDetails> _starterPokemons = [];
  Map<String, String> _pokedex = {};

  PokemonInfoViewModel._();

  Future<Map<String, String>> initializePokemonInfo() async {
    _pokedex = await fetchPokemonInfo();
    _starterPokemons
        .add(await PokemonService.instance.getPokemonDetails('charmander'));
    _starterPokemons
        .add(await PokemonService.instance.getPokemonDetails('squirtle'));
    _starterPokemons
        .add(await PokemonService.instance.getPokemonDetails('bulbasaur'));
    return _pokedex;
  }

  List<String> get allPokemonSprites =>
      _pokedex.keys.map((pkmName) => 'assets/sprites/$pkmName.png').toList();

  String getPokemonImage(String shortname) {
    return 'assets/images/$shortname';
  }

  // Returns a map of pokemon names mapped as { shortname: displayname }
  Map<String, String> get allPokemonNames {
    return _pokedex;
  }

  List<PokemonDetails> get starterPokemons {
    return _starterPokemons;
  }

  Future<PokemonDetails> getPokemonDetails(String shortName) async {
    if (_pokedex.containsKey(shortName)) {
      return await PokemonService.instance.getPokemonDetails(shortName);
    }
    throw 'No pokemon found';
  }
}
