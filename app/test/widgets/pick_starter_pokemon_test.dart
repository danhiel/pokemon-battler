import 'package:app/widgets/pokedex/pokemon_card.dart';
import 'package:app/widgets/pokemon_starter/pick_starter_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PickStarterPokemon', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: PickStarterPokemon()));

      // Verify that the correct number of Pokemon cards are displayed
      expect(find.byType(PokemonCard), findsNWidgets(3));

      // Verify that the "Select Pokemon" button is displayed
      expect(find.text('Select Pokemon'), findsOneWidget);
    });

    testWidgets(
        'calls onSelectPokemon callback when "Select Pokemon" button is tapped',
        (WidgetTester tester) async {
      // Create a mock callback function
      bool isCallbackCalled = false;

      // Build our widget with the mock callback
      await tester.pumpWidget(const MaterialApp(home: PickStarterPokemon()));

      // Tap the "Select Pokemon" button
      await tester.tap(find.text('Select Pokemon'));
      await tester.pumpAndSettle();

      // Verify that the callback function is called
      expect(isCallbackCalled, isTrue);
    });

    testWidgets('Verify rendered Pokemon card', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: PickStarterPokemon()));

      expect(find.text('Charmander'), findsOneWidget);
      expect(find.text('Bulbasaur'), findsOneWidget);
      expect(find.text('Squirtle'), findsOneWidget);
    });
  });
}
