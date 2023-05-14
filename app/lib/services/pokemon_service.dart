import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/pokemon_details_model.dart';

class PokemonService {
  static final instance = PokemonService._();

  PokemonService._();

  Future<String> getAllPokemonNames() async {
    final response = await http.get(Uri.parse(
        'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokedex=all'));
    return response.body;
  }

  Future<PokemonDetails> getPokemonDetails(String name) async {
    final response = await http.get(Uri.parse(
        'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokemon=${name}'));
    if (response.statusCode == 400) {
      throw Exception('Failed to find pokemon.');
    }
    return PokemonDetails.fromJson(jsonDecode(response.body));
  }

  Future<PokemonDetails> startPokemonBattle(String selectedPokemon) async {
    final response = await http.post(
        Uri.parse(
            'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/game.php'),
        body: {'mypokemon': selectedPokemon, 'startgame': true});
    if (response.statusCode == 400) {
      throw Exception('Invalid parameters.');
    }
    return PokemonDetails.fromJson(jsonDecode(response.body));
  }

  Future<PokemonDetails> playMove(String guid, String puid, String move) async {
    final response = await http.post(
        Uri.parse(
            'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/game.php'),
        body: {'guid': guid, 'puid': puid, 'movename': move});
    if (response.statusCode == 400) {
      throw Exception('Invalid parameters.');
    }
    return PokemonDetails.fromJson(jsonDecode(response.body));
  }
}
