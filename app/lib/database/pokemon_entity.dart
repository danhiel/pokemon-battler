import 'package:floor/floor.dart';

@entity
class Pokemon {
  @primaryKey
  final String shortName;

  final String name;

  bool selected;

  bool captured;

  Pokemon(this.shortName, this.name, this.selected, this.captured);
}
