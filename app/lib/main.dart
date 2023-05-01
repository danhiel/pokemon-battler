import 'package:app/database/pokemon_dao.dart';
import 'package:app/model/pokemon_details_model.dart';
import 'package:app/utils/pokedex_utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'database/database.dart';
import 'repos/pokemon_repository.dart';
import 'view_model/pokedex_view_model.dart';
import 'widgets/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  startUpDatabase();
  final pokedex = await initializePokedex();
  runApp(MyApp(pokedex));
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
  final Map<String, PokemonDetails> pokedex;

  const MyApp(this.pokedex, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: FutureBuilder(
            future: GetIt.instance.allReady(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ChangeNotifierProvider(
                    create: (context) => PokedexViewModel(pokedex),
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
