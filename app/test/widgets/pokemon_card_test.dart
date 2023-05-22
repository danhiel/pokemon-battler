import 'package:app/database/pokemon_entity.dart';
import 'package:app/widgets/pokemon_starter/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonCard', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      final Pokemon pokemon = Pokemon("charmander", "Charmander", false, false);

      await tester.pumpWidget(const MaterialApp(
          home: PokemonCard(
        displayName: 'Charmander',
        shortName: 'charmander',
      )));

      expect(find.text('Charmander'), findsOneWidget);
    });

    testWidgets('renders image correctly', (WidgetTester tester) async {
      final Pokemon pokemon = Pokemon("squirtle", "Squirtle", false, false);

      await tester.pumpWidget(const MaterialApp(
          home: PokemonCard(
        displayName: 'Squirtle',
        shortName: 'squirtle',
      )));

      expect(find.byType(Image), findsOneWidget);
      expect(tester.getSize(find.byType(Image)), const Size(150, 150));
    });
  });
}
