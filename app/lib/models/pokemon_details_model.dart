import 'package:app/models/pokemon_move_model.dart';

class PokemonDetails {
  final int id;
  final String name;
  final String shortName;
  final int hp;
  final int? currentHp;
  final String type;
  final String weakness;
  final String description;
  final String photo;
  final String sprite;
  final String typeIcon;
  final String weaknessIcon;
  final List<String>? buffs;
  final List<String>? debuffs;
  final List<Move> moves;

  const PokemonDetails(
      {required this.id,
      required this.name,
      required this.shortName,
      required this.hp,
      required this.type,
      required this.weakness,
      required this.description,
      required this.photo,
      required this.sprite,
      required this.typeIcon,
      required this.weaknessIcon,
      required this.moves,
      this.buffs,
      this.debuffs,
      this.currentHp});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    var newMoves = <Move>[];
    if (json['moves'] != null) {
      json['moves'].forEach((m) {
        newMoves.add(Move.fromJson(m));
      });
    }

    return PokemonDetails(
        id: json['info']['id'],
        name: json['name'],
        shortName: json['shortname'],
        hp: json['hp'],
        currentHp: json['current-hp'],
        type: json['info']['type'],
        weakness: json['info']['weakness'],
        description: json['info']['description'],
        photo: 'assets/${json['images']['photo']}',
        sprite: 'assets/sprites/${json['shortname']}.png',
        typeIcon: 'assets/${json['images']['typeIcon']}',
        weaknessIcon: 'assets/${json['images']['weaknessIcon']}',
        moves: newMoves,
        buffs: List<String>.from(json['buffs']).toList(),
        debuffs: List<String>.from(json['debuffs']).toList());
  }
}
