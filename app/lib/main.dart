import 'package:app/database/database.dart';
import 'package:app/database/database_loader.dart';
import 'package:app/view_models/pkm_info_view_model.dart';
import 'package:app/widgets/app.dart';
import 'package:app/widgets/common/background_image.dart';
import 'package:app/widgets/pokemon_starter/pick_starter_pokemon.dart';
import 'package:app/widgets/start_up/start_up.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'view_models/pokedex_view_model.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'start',
      builder: (context, _) => const StartUp(),
    ),
    GoRoute(
        path: '/new',
        name: 'newUser',
        builder: (context, _) => const PickStarterPokemon()),
    GoRoute(path: '/home', name: 'home', builder: (context, _) => const App()),
    GoRoute(
        path: '/pokedex', name: 'pokedex', builder: (context, _) => StartUp()),
    GoRoute(
        path: '/battle', name: 'battle', builder: (context, _) => StartUp()),
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
    renderLoadingScreen() {
      return Stack(children: const [
        BackgroundImage(),
        Center(
          child: Image(
              image: AssetImage('assets/icons/loading-pikachu.gif'),
              height: 120),
        )
      ]);
    }

    return MaterialApp(
        home: FutureBuilder(
            future: pokedexInfo,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ChangeNotifierProvider(
                    create: (context) => PokedexViewModel(),
                    child: MaterialApp.router(
                      title: 'Pokemon Battler',
                      debugShowCheckedModeBanner: false,
                      theme: ThemeData(
                        primarySwatch: Colors.red,
                      ),
                      routerConfig: router,
                    ));
              }
              return renderLoadingScreen();
            }));
  }
}
