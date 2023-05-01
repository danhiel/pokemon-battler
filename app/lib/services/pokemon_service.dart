import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/pokemon_details_model.dart';

Future<String> getAllPokemonNames() async {
  final response = await http.get(Uri.parse(
      'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokedex=all'));
  return response.body;
}

Future<PokemonDetails> getPokemonDetails(String name) async {
  final response = await http.get(Uri.parse(
      'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokemon=${name}'));
  return PokemonDetails.fromJson(jsonDecode(response.body));
}
