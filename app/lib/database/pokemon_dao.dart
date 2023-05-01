import 'package:floor/floor.dart';
import '../model/pokemon_model.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemon')
  Future<List<Pokemon>> getAllPokemon();

  @Query('SELECT * FROM Pokemon')
  Stream<List<Pokemon>> watchAllPokemons();

  @insert
  Future<void> insertPokemon(Pokemon pokemon);

  @update
  Future<void> updatePokemon(Pokemon pokemon);
}
