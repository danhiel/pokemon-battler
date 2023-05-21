import 'package:app/database/database.dart';
import 'package:app/database/database_loader.dart';
import 'package:floor/floor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonDatabase', () {
    late PokedexDatabase database;

    setUpAll(() async {
      final initCallback = Callback(onCreate: (database, _) async {
        await fetchPokemonInfo(database.insert);
      });
      database = await $FloorPokedexDatabase
          .inMemoryDatabaseBuilder()
          .addCallback(initCallback)
          .build();
    });

    tearDownAll(() async {
      await database.close();
    });

    test('Should find all pokemon', () async {
      // when
      final actual = await database.pokemonDao.getAllPokemons();

      // then
      expect(actual.length, 151);
    });
  });
}
