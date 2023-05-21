import 'package:app/database/pokemon_entity.dart';
import 'package:app/widgets/pokemon_starter/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonCard', () {
    // testWidgets('renders correctly', (WidgetTester tester) async {
    //   final Pokemon pokemon = Pokemon(
    //       "1",
    //       "Charmander",
    //       "CH",
    //       "type",
    //       "weakness",
    //       "description",
    //       100,
    //       100,
    //       "",
    //       "assets/pokemons/charmander.jpg",
    //       "assets/pokemons/charmander.jpg",
    //       "typeIcon",
    //       "weaknessIcon",
    //       false);
    //   await tester.pumpWidget(MaterialApp(
    //       home: PokemonCard(
    //     pokemon: pokemon,
    //   )));

    //   expect(find.text('Charmander'), findsOneWidget);
    //   expect(find.text('Type: type'), findsOneWidget);
    // });

    // testWidgets('renders image correctly', (WidgetTester tester) async {
    //   final Pokemon pokemon = Pokemon(
    //       "1",
    //       "Charmander",
    //       "CH",
    //       "type",
    //       "weakness",
    //       "description",
    //       100,
    //       100,
    //       "",
    //       "assets/pokemons/charmander.jpg",
    //       "assets/pokemons/charmander.jpg",
    //       "typeIcon",
    //       "weaknessIcon",
    //       false);
    //   await tester.pumpWidget(MaterialApp(
    //       home: PokemonCard(
    //     pokemon: pokemon,
    //   )));

    //   expect(find.byType(Image), findsOneWidget);
    //   expect(tester.getSize(find.byType(Image)), const Size(150, 150));
    // });
  });
}
