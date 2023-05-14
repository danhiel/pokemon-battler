import 'package:app/database/database.dart';
import 'package:app/database/pokemon_dao.dart';
import 'package:app/repos/pokemon_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:app/model/pokemon_details_model.dart';
import 'package:app/services/pokemon_service.dart';

Future<Map<String, PokemonDetails>> fetchPokemonInfo() async {
  Map<String, PokemonDetails> pokedex = {};
  PokemonService.instance.getAllPokemonNames().then((res) async {
    var splits = res.split('\n');
    for (var name in splits) {
      var nameSplit = name.split(':');
      var pkmDetails =
          (await PokemonService.instance.getPokemonDetails(nameSplit[0]));
      pokedex[nameSplit[1]] = pkmDetails;
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
