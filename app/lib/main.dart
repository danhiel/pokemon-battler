import 'package:app/database/database.dart';
import 'package:app/database/database_loader.dart';
import 'package:app/widgets/app.dart';
import 'package:app/widgets/battle/battle.dart';
import 'package:app/widgets/home/home.dart';
import 'package:app/widgets/pokemon_details/pokemon_details.dart';
import 'package:app/widgets/pokemon_starter/pick_starter_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'view_models/pokedex_view_model.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'app',
      builder: (context, _) => const App(),
    ),
    GoRoute(
        path: '/new',
        name: 'newUser',
        builder: (context, _) => const PickStarterPokemon()),
    GoRoute(path: '/home', name: 'home', builder: (context, _) => const Home()),
    GoRoute(
        path: '/pokemon',
        name: 'pokemonDetails',
        builder: (BuildContext context, GoRouterState state) {
          final name = state.queryParameters['name']!;
          return PokemonDetailsScreen(name: name,);
        },
    ),
    GoRoute(
        path: '/battle',
        name: 'battle',
        builder: (context, _) => const Battle()),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(database: await loadDatabase()));
}

class MyApp extends StatelessWidget {
  final PokedexDatabase database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
            create: (context) => PokedexViewModel(database),
            child: MaterialApp.router(
              title: 'Pokemon Battler',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.red,
              ),
              routerConfig: router,
            )));
  }
}
