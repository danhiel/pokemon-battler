import 'package:app/database/pokemon_entity.dart';
import 'package:app/view_models/pokedex_view_model.dart';
import 'package:app/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'app_test.mocks.dart';

@GenerateMocks([PokedexViewModel])
void main() {
  testWidgets('renders correctly when starter pokemon doesn\'t exist',
      (WidgetTester tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    when(pokedexViewModel.selectedPokemon).thenReturn(null);
    final router = GoRouter(routes: [
      GoRoute(
          path: '/',
          builder: (context, _) => const Scaffold(
                body: App(),
              )),
      GoRoute(
          path: '/home',
          builder: (context, _) => const Scaffold(
                body: Text('Home'),
              )),
      GoRoute(
          path: '/new',
          builder: (context, state) => const Scaffold(
                body: Text('New'),
              )),
    ]);

    // when
    await tester.pumpWidget(ChangeNotifierProvider<PokedexViewModel>.value(
        value: pokedexViewModel,
        child: MaterialApp.router(routerConfig: router)));
    await tester.tap(find.text('Press to start'));
    await tester.pumpAndSettle();

    // then
    expect(find.text('Home'), findsNothing);
    expect(find.text('New'), findsOneWidget);
  });

  testWidgets('renders correctly when starter pokemon exist',
      (WidgetTester tester) async {
    // given
    final pokedexViewModel = MockPokedexViewModel();
    when(pokedexViewModel.selectedPokemon)
        .thenReturn(Pokemon('pikachu', 'Pikachu', true, true));
    final router = GoRouter(routes: [
      GoRoute(
          path: '/',
          builder: (context, _) => const Scaffold(
                body: App(),
              )),
      GoRoute(
          path: '/home',
          builder: (context, _) => const Scaffold(
                body: Text('Home'),
              )),
      GoRoute(
          path: '/new',
          builder: (context, state) => const Scaffold(
                body: Text('New'),
              )),
    ]);

    // when
    await tester.pumpWidget(ChangeNotifierProvider<PokedexViewModel>.value(
        value: pokedexViewModel,
        child: MaterialApp.router(routerConfig: router)));
    await tester.tap(find.text('Press to start'));
    await tester.pumpAndSettle();

    // then
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('New'), findsNothing);
  });
}
