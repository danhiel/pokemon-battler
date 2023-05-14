import 'package:floor/floor.dart';

@entity
class Pokemon {
  @primaryKey
  final String shortName;
  final String name;
  bool isCaptured;

  Pokemon(this.name, this.shortName, this.isCaptured);
}
