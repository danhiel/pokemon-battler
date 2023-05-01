import 'package:app/model/pokemon_details_model.dart';
import 'package:app/services/pokemon_service.dart';

Future<Map<String, PokemonDetails>> initializePokedex() async {
  Map<String, PokemonDetails> pokedex = {};
  getAllPokemonNames().then((res) async {
    var splits = res.split('\n');
    for (var name in splits) {
      var nameSplit = name.split(':');
      var pkmDetails = (await getPokemonDetails(nameSplit[0]));
      pokedex[nameSplit[1]] = pkmDetails;
    }
  });
  return pokedex;
}
