import 'package:app/model/pokemon_details_model.dart';

class BattleInfo {
  final String guid;
  final String pid;
  final PokemonDetails p1;
  final PokemonDetails p2;

  BattleInfo(
      {required this.guid,
      required this.pid,
      required this.p1,
      required this.p2});

  factory BattleInfo.fromJson(Map<String, dynamic> json) {
    var newP1 = PokemonDetails.fromJson(json['p1']);
    var newP2 = PokemonDetails.fromJson(json['p2']);

    return BattleInfo(
        guid: json['guid'], pid: json['pid'], p1: newP1, p2: newP2);
  }
}
