import 'package:http/http.dart' as http;

Future<http.Response> getAllPokemonNames() {
  return http.get(Uri.parse(
      'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokedex=all'));
}

Future<http.Response> getPokemonDetails(String name) {
  return http.get(Uri.parse(
      'https://courses.cs.washington.edu/courses/cse154/webservices/pokedex/pokedex.php?pokemon=${name}'));
}
