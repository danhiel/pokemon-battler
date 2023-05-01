import 'package:app/database/pokemon_dao.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'database/database.dart';
import 'repos/pokemon_repository.dart';
import 'view_model/pokedex_view_model.dart';
import 'widgets/app.dart';

void main() {
  startUpDatabase();
  runApp(const MyApp());
}

void startUpDatabase() {
  GetIt getIt = GetIt.instance;

  // Register database
  getIt.registerSingletonAsync<AppDatabase>(
      () async => $FloorAppDatabase.databaseBuilder('pokemon.db').build());

  // Register DAO
  getIt.registerSingletonWithDependencies<PokemonDao>(() {
    return GetIt.instance.get<AppDatabase>().pokemonDao;
  }, dependsOn: [AppDatabase]);

  // Register repositories.
  getIt.registerSingletonWithDependencies<PokemonRepository>(
      () => PokemonRepository(),
      dependsOn: [AppDatabase, PokemonDao]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
            future: GetIt.instance.allReady(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ChangeNotifierProvider(
                    create: (context) => PokedexViewModel(),
                    child: MaterialApp(
                      title: 'Pokemon Battler',
                      theme: ThemeData(
                        primarySwatch: Colors.red,
                      ),
                      home: const App(),
                    ));
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
