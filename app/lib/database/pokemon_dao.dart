import 'package:app/database/pokemon_entity.dart';
import 'package:floor/floor.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM Pokemon')
  Future<List<Pokemon>> getAllPokemons();

  @Query('SELECT * FROM Pokemon WHERE captured')
  Future<List<Pokemon>> getAllCapturedPokemons();

  @Query('SELECT * FROM Pokemon')
  Stream<List<Pokemon>> watchAllPokemons();

  @Query('SELECT * FROM Pokemon WHERE shortName = :shortName')
  Future<Pokemon?> getPokemonByShortName(String shortName);

  @Query('SELECT * FROM Pokemon WHERE id = :id')
  Future<Pokemon?> getPokemonById(int id);

  @Query('SELECT * FROM Pokemon WHERE selected')
  Future<Pokemon?> getSelectedPokemon();

  @insert
  Future<void> insertPokemon(Pokemon pokemon);

  @update
  Future<void> updatePokemon(Pokemon pokemon);
}
