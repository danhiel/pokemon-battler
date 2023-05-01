import 'dart:async';
import 'package:app/database/pokemon_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/pokemon_model.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Pokemon])
abstract class AppDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;
}
