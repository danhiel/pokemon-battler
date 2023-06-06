import 'package:app/database/pokemon_entity.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/pokedex/pokedex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'pokedex_test.mocks.dart';

@GenerateMocks([PokedexViewModel])
void main() {
  testWidgets('Should render all pokedex', (tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    when(pokedexViewModel.allPokemons).thenReturn([
      Pokemon('pikachu', 'Pikachu', true, true),
      Pokemon('charmander', 'Charmander', false, false)
    ]);
    when(pokedexViewModel.selectedPokemon)
        .thenReturn(Pokemon('pikachu', 'Pikachu', true, true));

    // when
    await tester.pumpWidget(ChangeNotifierProvider<PokedexViewModel>.value(
        value: pokedexViewModel,
        child: const MaterialApp(home: Scaffold(body: Pokedex()))));

    // then
    expect(find.byType(Image), findsNWidgets(2));
  });

  testWidgets('Should render captured pokedex', (tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    when(pokedexViewModel.allPokemons).thenReturn([
      Pokemon('pikachu', 'Pikachu', true, true),
      Pokemon('charmander', 'Charmander', false, false)
    ]);
    when(pokedexViewModel.allCapturedPokemons).thenReturn([
      Pokemon('pikachu', 'Pikachu', true, true),
    ]);
    when(pokedexViewModel.selectedPokemon)
        .thenReturn(Pokemon('pikachu', 'Pikachu', true, true));

    // when
    await tester.pumpWidget(ChangeNotifierProvider<PokedexViewModel>.value(
        value: pokedexViewModel,
        child: const MaterialApp(home: Scaffold(body: Pokedex()))));
    await tester.tap(find.text('Captured'));
    await tester.pumpAndSettle();

    // then
    expect(find.byType(Image), findsNWidgets(1));
  });
}
