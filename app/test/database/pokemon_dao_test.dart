import 'package:app/model/pokemon_model.dart';
import 'package:floor/floor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/database/database.dart';
import 'package:app/database/pokemon_dao.dart';

void main() {
  group('database tests', () {
    late AppDatabase database;
    late PokemonDao pokemonDao;

    setUp(() async {
      database = await $FloorAppDatabase.inMemoryDatabaseBuilder().build();
      pokemonDao = database.pokemonDao;
    });

    tearDown(() async {
      await database.close();
    });

    test('find all pokemon', () async {
      final pokemon = Pokemon('1', 'Charmander', 'charmander', 'fire', 'water',
          'a pokemon', 45, 45, 'attack', '', '', ', ', '', false);
      await pokemonDao.insertPokemon(pokemon);

      final actual = await pokemonDao.getAllPokemon();

      expect(actual[0].id, pokemon.id);
    });

    test('update pokemon', () async {
      final pokemon = Pokemon('1', 'Charmander', 'charmander', 'fire', 'water',
          'a pokemon', 45, 45, 'attack', '', '', ', ', '', false);
      await pokemonDao.insertPokemon(pokemon);
      final actual = pokemonDao.watchAllPokemons();

      final updatedPokemon = Pokemon('1', 'Charmy', 'charmander', 'fire',
          'water', 'a pokemon', 45, 45, 'attack', '', '', ', ', '', false);
      await pokemonDao.updatePokemon(updatedPokemon);

      expect((await actual.first)[0].name, 'Charmy');
    });
  });
}
