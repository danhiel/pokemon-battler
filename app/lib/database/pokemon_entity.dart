import 'package:floor/floor.dart';

@entity
class Pokemon {
  @primaryKey
  final int id;

  final String shortName;

  final String name;

  bool selected;

  bool captured;

  Pokemon(this.id, this.shortName, this.name, this.selected, this.captured);
}
