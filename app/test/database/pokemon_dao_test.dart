import 'package:flutter_test/flutter_test.dart';
import 'package:app/database/pokemon_entity.dart';
import 'package:app/database/database.dart';
import 'package:app/database/pokemon_dao.dart';

void main() {
  group('PokemonDatabase', () {
    late PokedexDatabase database;
    late PokemonDao pokemonDao;

    setUpAll(() async {
      database = await $FloorPokedexDatabase.inMemoryDatabaseBuilder().build();
      pokemonDao = database.pokemonDao;

      // Given
      await pokemonDao
          .insertPokemon(Pokemon('charmander', 'Charmander', true, true));
      await pokemonDao
          .insertPokemon(Pokemon('bulbasaur', 'Bulbasaur', false, true));

      await pokemonDao
          .insertPokemon(Pokemon('squirtle', 'Squirtle', false, false));
    });

    tearDownAll(() async {
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
      final updatedPokemon = Pokemon('charmander', 'Chary', true, true);

      // when
      await pokemonDao.updatePokemon(updatedPokemon);
      final actual = await pokemonDao.getPokemonByShortName('charmander');

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

      expect(actual.length, 2);
    });

    test('Should watch all pokemons', () async {
      // given
      var calls = 0;
      var subscription = pokemonDao.watchAllPokemons().listen((pokemons) {
        calls++;
      });

      // when
      await pokemonDao
          .insertPokemon(Pokemon('pikachu', 'Pikachu', false, false));

      // then
      expect(calls, 1);
      subscription.cancel();
    });
  });
}
