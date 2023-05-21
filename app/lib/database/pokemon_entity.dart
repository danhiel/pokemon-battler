import 'package:floor/floor.dart';

@entity
class Pokemon {
  @primaryKey
  final int id;

  final bool selected;

  final String shortName;

  final String name;

  final bool captured;

  Pokemon(this.id, this.selected, this.shortName, this.name, this.captured);
}
