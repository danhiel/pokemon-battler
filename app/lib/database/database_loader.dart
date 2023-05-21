import 'package:app/database/database.dart';
import 'package:app/services/pokemon_service.dart';
import 'package:floor/floor.dart';

Future<void> fetchPokemonInfo(Function databaseInsert) async {
  await PokemonService.instance.getAllPokemonNames().then((res) async {
    var splits = res.split('\n');
    for (var name in splits) {
      var nameSplit = name.split(':');
      await databaseInsert('pokemon', {
        'shortname': nameSplit[1],
        'name': nameSplit[0],
        'selected': 0,
        'captured': 0
      });
    }
  });
}

Future<PokedexDatabase> loadDatabase() async {
  final initCallback = Callback(onCreate: (database, _) async {
    await fetchPokemonInfo(database.insert);
  });
  return $FloorPokedexDatabase
      .databaseBuilder('pokedex_database.db')
      .addCallback(initCallback)
      .build();
}
