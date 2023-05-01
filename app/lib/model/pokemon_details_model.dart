import 'package:app/model/pokemon_move_model.dart';

class PokemonDetails {
  final int id;
  final String name;
  final String shortName;
  final int hp;
  final String type;
  final String weakness;
  final String description;
  final String photo;
  final String sprite;
  final String typeIcon;
  final String weaknessIcon;

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
      required this.weaknessIcon});

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    return PokemonDetails(
      id: json['info']['id'],
      name: json['name'],
      shortName: json['shortname'],
      hp: json['hp'],
      type: json['info']['type'],
      weakness: json['info']['weakness'],
      description: json['info']['description'],
      photo: 'assets/${json['images']['photo']}',
      sprite: 'assets/sprites/${json['shortname']}.png',
      typeIcon: 'assets/${json['images']['typeIcon']}',
      weaknessIcon: 'assets/${json['images']['weaknessIcon']}',
    );
  }
}
