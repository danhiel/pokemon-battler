import 'package:app/database/pokemon_entity.dart';
import 'package:app/view_models/geolocation_view_model.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/battle/battle_home.dart';
import 'package:app/widgets/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'home_test.mocks.dart';

@GenerateMocks([PokedexViewModel, GeolocationViewModel])
void main() {
  testWidgets('Should render home widget', (tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    final geolocationViewModel = MockGeolocationViewModel();
    when(pokedexViewModel.selectedPokemon)
        .thenReturn(Pokemon('pikachu', 'Pikachu', true, true));
    when(geolocationViewModel.distance).thenReturn(150);

    // when
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokedexViewModel>.value(value: pokedexViewModel),
        ChangeNotifierProvider<GeolocationViewModel>.value(
            value: geolocationViewModel)
      ],
      child: const MaterialApp(home: Home()),
    ));

    // then
    expect(find.text('Battle'), findsNWidgets(2));
  });
}
