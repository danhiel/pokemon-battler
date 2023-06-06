import 'package:app/main.dart';
import 'package:app/view_models/geolocation_view_model.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'profile_test.mocks.dart';

@GenerateMocks([PokedexViewModel, GeolocationViewModel])
void main() {
  testWidgets('Should render profile widget', (tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    final geolocationViewModel = MockGeolocationViewModel();
    when(pokedexViewModel.allCapturedPokemons).thenReturn([]);
    when(geolocationViewModel.totalDistance).thenReturn(100);

    // when
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokedexViewModel>.value(value: pokedexViewModel),
        ChangeNotifierProvider<GeolocationViewModel>.value(
            value: geolocationViewModel)
      ],
      child: const MaterialApp(home: Profile()),
    ));

    // then
    expect(find.text('Reset Pokedex'), findsOneWidget);
  });

  testWidgets('Should call reset pokedex', (tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    final geolocationViewModel = MockGeolocationViewModel();
    when(pokedexViewModel.allCapturedPokemons).thenReturn([]);
    when(geolocationViewModel.totalDistance).thenReturn(100);
    final router = GoRouter(routes: [
      GoRoute(
          path: '/',
          builder: (context, _) => const Scaffold(
                body: Profile(),
              )),
      GoRoute(
          path: '/new',
          builder: (context, state) => const Scaffold(
                body: Text('New Screen'),
              )),
    ]);

    // when
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<PokedexViewModel>.value(value: pokedexViewModel),
        ChangeNotifierProvider<GeolocationViewModel>.value(
            value: geolocationViewModel)
      ],
      child: MaterialApp.router(routerConfig: router),
    ));
    await tester.tap(find.text('Reset Pokedex'));
    await tester.pumpAndSettle();

    // then
    verify(pokedexViewModel.reset()).called(1);
    expect(find.text('New Screen'), findsOneWidget);
  });
}
