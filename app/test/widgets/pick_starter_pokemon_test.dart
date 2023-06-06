import 'package:app/database/database.dart';
import 'package:app/database/pokemon_entity.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/pokemon_starter/pokemon_card.dart';
import 'package:app/widgets/pokemon_starter/pick_starter_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

@GenerateMocks([PokedexViewModel])
void main() {
  group('PickStarterPokemon', () {
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

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: viewModel,
            child: const PickStarterPokemon(),
          ),
        ),
      );

      // Verify that the correct number of Pokemon cards are displayed
      expect(find.byType(PokemonCard), findsNWidgets(3));

      // Verify that the "Select Pokemon" button is displayed
      expect(find.text('Select Pokemon'), findsOneWidget);
    });

    testWidgets('Verify rendered Pokemon card', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: viewModel,
            child: const PickStarterPokemon(),
          ),
        ),
      );

      expect(find.text('Charmander'), findsOneWidget);
      expect(find.text('Bulbasaur'), findsOneWidget);
      expect(find.text('Squirtle'), findsOneWidget);
    });
  });
}
