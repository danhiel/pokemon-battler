import 'package:app/database/database.dart';
import 'package:app/database/pokemon_dao.dart';
import 'package:app/repos/pokemon_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:app/services/pokemon_service.dart';

Future<Map<String, String>> fetchPokemonInfo() async {
  Map<String, String> pokedex = {};
  await PokemonService.instance.getAllPokemonNames().then((res) async {
    var splits = res.split('\n');
    for (var name in splits) {
      var nameSplit = name.split(':');
      pokedex[nameSplit[1]] = nameSplit[0]; // shortname : displayname
    }
  });
  return pokedex;
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
