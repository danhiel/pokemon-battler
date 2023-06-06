import 'package:app/database/pokemon_entity.dart';
import 'package:app/models/pokemon_details_model.dart';
import 'package:app/models/pokemon_move_model.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/pokemon_details/pokemon_detail_moves.dart';
import 'package:app/widgets/pokemon_details/pokemon_details.dart';
import 'package:app/widgets/pokemon_details/pokemon_details_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/services/pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'pokemon_detail_test.mocks.dart';

class MockPokemonService extends Mock implements PokemonService {}

class MockPokemonDetails extends Mock implements PokemonDetails {}

@GenerateMocks([PokedexViewModel])
void main() {
  testWidgets('Should render PokemonDetailsInfo', (tester) async {
    // given
    final pokemonDetails = PokemonDetails(
        id: 1,
        name: 'Pikachu',
        shortName: 'pikachu',
        hp: 180,
        type: 'electric',
        weakness: 'fire',
        description: 'desc',
        photo: 'photo',
        sprite: 'assets/sprites/pikachu.png',
        typeIcon: 'assets/icons/electric.jpg',
        weaknessIcon: 'assets/icons/fire.jpg',
        moves: [
          Move(name: 'Slam', type: 'normal', dp: 10),
          Move(name: 'Vine Whip', type: 'grass', dp: 20),
        ]);
    final pokemon = Pokemon('pikachu', 'Pikachu', false, false);
    final pokedexViewModel = MockPokedexViewModel();
    when(pokedexViewModel.getPokemonByShortName(any)).thenReturn(pokemon);
    when(pokedexViewModel.selectedPokemon).thenReturn(pokemon);

    // when
    await tester.pumpWidget(ChangeNotifierProvider<PokedexViewModel>.value(
        value: pokedexViewModel,
        child: MaterialApp(
            home: Scaffold(
                body: PokemonDetailInfoScreen(pokemon: pokemonDetails)))));

    // then
    expect(find.text('Pikachu'), findsOneWidget);
  });

  testWidgets('PokemonDetailMovesScreen shows correct data',
      (WidgetTester tester) async {
    // Test with some moves
    var moves = [
      Move(name: 'Slam', type: 'normal', dp: 10),
      Move(name: 'Vine Whip', type: 'grass', dp: 20),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PokemonDetailMovesScreen(moves: moves),
        ),
      ),
    );

    // Check that 'Moves: ' title is shown
    expect(find.text('Moves: '), findsOneWidget);

    // Check that each move is shown with the correct data
    for (final move in moves) {
      expect(find.text(move.name), findsOneWidget);
      expect(find.text('${move.dp} DP'), findsOneWidget);
    }

    // Test with an empty list
    moves = [];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PokemonDetailMovesScreen(moves: moves),
        ),
      ),
    );

    // Check that 'Moves: ' title is shown
    expect(find.text('Moves: '), findsOneWidget);

    // Check that no moves are shown
    expect(find.byType(ListTile), findsNothing);

    // Test with null DP in moves
    moves = [
      Move(name: 'Slam', type: 'normal', dp: null),
      Move(name: 'Vine Whip', type: 'grass', dp: null),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PokemonDetailMovesScreen(moves: moves),
        ),
      ),
    );

    // Check that '0 DP' is shown for each move
    for (final move in moves) {
      expect(find.text('${move.dp ?? 0} DP'), findsAtLeastNWidgets(2));
    }
  });
}
