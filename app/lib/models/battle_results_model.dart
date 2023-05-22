import 'package:app/models/pokemon_details_model.dart';

class Results {
  final String p1Move;
  final String p2Move;
  final PokemonDetails p1Result;
  final PokemonDetails p2Result;

  Results(
      {required this.p1Move,
      required this.p2Move,
      required this.p1Result,
      required this.p2Result});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
        p1Move: json['p1-move'],
        p2Move: json['p2-move'],
        p1Result: json['p1-result'],
        p2Result: json['p2-result']);
  }
}
