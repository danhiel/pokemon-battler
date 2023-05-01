import 'package:app/database/pokemon_dao.dart';
import 'package:get_it/get_it.dart';

import '../model/pokemon_model.dart';

class PokemonRepository {
  late PokemonDao _pokemonDao;

  PokemonRepository() {
    _pokemonDao = GetIt.instance.get<PokemonDao>();
  }

  Stream<List<Pokemon>> watchAllPokemons() {
    return _pokemonDao.watchAllPokemons();
  }

  Future<List<Pokemon>> getAllPokemon() {
    return _pokemonDao.getAllPokemon();
  }

  Future<void> insertPokemon(Pokemon pokemon) {
    return _pokemonDao.insertPokemon(pokemon);
  }

  Future<void> updatePokemon(Pokemon pokemon) {
    return _pokemonDao.updatePokemon(pokemon);
  }
}
