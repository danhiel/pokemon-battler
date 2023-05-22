import 'package:app/database/database.dart';
import 'package:app/database/database_loader.dart';
import 'package:app/database/pokemon_entity.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/app.dart';
import 'package:floor/floor.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';

void main() {
  group('PokedexViewModel', () {
    late PokedexDatabase database;
    late PokedexViewModel viewModel;

    setUpAll(() async {
      database = await $FloorPokedexDatabase.inMemoryDatabaseBuilder().build();
      viewModel = PokedexViewModel(database);

      // Given
      await viewModel
          .insertPokemon(Pokemon('charmander', 'Charmander', false, false));
      await viewModel
          .insertPokemon(Pokemon('bulbasaur', 'Bulbasaur', false, false));
      await viewModel
          .insertPokemon(Pokemon('squirtle', 'Squirtle', false, false));
    });

    tearDownAll(() async {
      await database.close();
    });

    testWidgets('should get starter screen', (WidgetTester tester) async {
      // when
      await tester.pumpWidget(MyApp(database: database));

      // then
      expect(find.text('Press to start'), findsOneWidget);
    });

    testWidgets('should select starter pokemon', (WidgetTester tester) async {
      // when
      await tester.pumpWidget(MyApp(database: database));

      await tester.tap(find.text('Press to start'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Select Pokemon'));
      await tester.pumpAndSettle();

      // then
      expect(find.text('Pokedex'), findsOneWidget);
    });
  });
}
