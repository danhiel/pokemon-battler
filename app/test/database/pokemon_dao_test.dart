import 'package:app/database/pokemon_entity.dart';
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

      // Given
      await pokemonDao
          .insertPokemon(Pokemon(1, true, 'charmander', 'Charmander', true));
      await pokemonDao
          .insertPokemon(Pokemon(2, false, 'bulbasaur', 'Bulbasaur', true));

      await pokemonDao
          .insertPokemon(Pokemon(3, false, 'squirtle', 'Squirtle', false));
    });

    tearDown(() async {
      await database.close();
    });

    test('Should find all pokemon', () async {
      // when
      final actual = await pokemonDao.getAllPokemons();

      // then
      expect(actual[0].name, 'Charmander');
      expect(actual[1].name, 'Bulbasaur');
    });

    test('Should update pokemon', () async {
      // given
      final updatedPokemon = Pokemon(1, true, 'charmander', 'Chary', false);

      // when
      await pokemonDao.updatePokemon(updatedPokemon);
      final actual = await pokemonDao.getPokemonById(1);

      expect(actual, isNot(null));
      expect(actual?.name, 'Chary');
    });

    test('Should get pokemon by short name', () async {
      // when
      final actual = await pokemonDao.getPokemonByShortName('squirtle');

      expect(actual?.name, 'Squirtle');
    });

    test('Should get all captured pokemon', () async {
      // when
      final actual = await pokemonDao.getAllCapturedPokemons();

      expect(actual[0].shortName, 'charmander');
      expect(actual[1].shortName, 'bulbasaur');
    });

    test('Should watch all pokemons', () async {
      // given
      var calls = 0;
      var subscription = pokemonDao.watchAllPokemons().listen((pokemons) {
        calls++;
      });

      // when
      await pokemonDao
          .insertPokemon(Pokemon(4, false, 'pikachu', 'Pikachu', false));

      // then
      expect(calls, 1);
      subscription.cancel();
    });
  });
}
