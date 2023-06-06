import 'package:app/database/pokemon_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/database/database.dart';

void main() {
  group('PokedexViewModel', () {
    late PokedexDatabase database;
    late PokedexViewModel viewModel;

    setUpAll(() async {
      database = await $FloorPokedexDatabase.inMemoryDatabaseBuilder().build();
      viewModel = PokedexViewModel(database);

      // Given
      await viewModel
          .insertPokemon(Pokemon('charmander', 'Charmander', true, true));
      await viewModel
          .insertPokemon(Pokemon('bulbasaur', 'Bulbasaur', false, true));
      await viewModel
          .insertPokemon(Pokemon('squirtle', 'Squirtle', false, false));
    });

    tearDownAll(() async {
      await database.close();
    });

    test('should get all pokemons', () async {
      // when
      final actual = viewModel.allPokemons;

      // then
      expect(actual.length, 3);
      expect(actual[0].name, 'Charmander');
    });

    test('should get all captured pokemons', () async {
      // when
      final actual = viewModel.allCapturedPokemons;

      // then
      expect(actual.length, 2);
      expect(actual[0].name, 'Charmander');
    });

    test('should get selected pokemon', () async {
      // when
      final actual = await viewModel.selectedPokemon;

      // then
      expect(actual?.name, 'Charmander');
    });

    test('should set selected pokemon by name', () async {
      // when
      await viewModel.setSelectedPokemon(shortName: 'bulbasaur');
      var actual = await viewModel.selectedPokemon;

      // then
      expect(actual?.shortName, 'bulbasaur');
    });

    test('should set selected pokemon by Pokemon', () async {
      // when
      await viewModel.setSelectedPokemon(
          pokemon: Pokemon('squirtle', 'Squirtle', true, false));
      var actual = await viewModel.selectedPokemon;

      // then
      expect(actual?.shortName, 'squirtle');
      expect(actual?.captured, true);
    });

    test('should set pokemon captured.', () async {
      // when
      await viewModel.setCapturedPokemon(
          isCaptured: false, shortName: 'squirtle');
      var actual = viewModel.allPokemons
          .firstWhere((pkm) => pkm.shortName == 'squirtle');

      // then
      expect(actual.captured, false);
    });

    test('should reset pokedex.', () async {
      // when
      await viewModel.reset();
      var actual = viewModel.allCapturedPokemons;

      // then
      expect(actual.length, 0);
    });
  });
}
