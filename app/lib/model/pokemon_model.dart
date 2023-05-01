import 'package:floor/floor.dart';

@entity
class Pokemon {
  @primaryKey
  final String id;
  final String name;
  final String shortName;
  final String type;
  final String weakness;
  final String description;
  final int hp;
  int currentHp;
  final String moves;
  final String photo;
  final String sprite;
  final String typeIcon;
  final String weaknessIcon;
  bool isCaptured;

  Pokemon(
      this.id,
      this.name,
      this.shortName,
      this.type,
      this.weakness,
      this.description,
      this.hp,
      this.currentHp,
      this.moves,
      this.photo,
      this.sprite,
      this.typeIcon,
      this.weaknessIcon,
      this.isCaptured);
}
