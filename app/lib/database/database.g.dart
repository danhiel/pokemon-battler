// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorPokedexDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokedexDatabaseBuilder databaseBuilder(String name) =>
      _$PokedexDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$PokedexDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$PokedexDatabaseBuilder(null);
}

class _$PokedexDatabaseBuilder {
  _$PokedexDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$PokedexDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$PokedexDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<PokedexDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$PokedexDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$PokedexDatabase extends PokedexDatabase {
  _$PokedexDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PokemonDao? _pokemonDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Pokemon` (`id` INTEGER NOT NULL, `shortName` TEXT NOT NULL, `name` TEXT NOT NULL, `selected` INTEGER NOT NULL, `captured` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PokemonDao get pokemonDao {
    return _pokemonDaoInstance ??= _$PokemonDao(database, changeListener);
  }
}

class _$PokemonDao extends PokemonDao {
  _$PokemonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _pokemonInsertionAdapter = InsertionAdapter(
            database,
            'Pokemon',
            (Pokemon item) => <String, Object?>{
                  'id': item.id,
                  'shortName': item.shortName,
                  'name': item.name,
                  'selected': item.selected ? 1 : 0,
                  'captured': item.captured ? 1 : 0
                },
            changeListener),
        _pokemonUpdateAdapter = UpdateAdapter(
            database,
            'Pokemon',
            ['id'],
            (Pokemon item) => <String, Object?>{
                  'id': item.id,
                  'shortName': item.shortName,
                  'name': item.name,
                  'selected': item.selected ? 1 : 0,
                  'captured': item.captured ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Pokemon> _pokemonInsertionAdapter;

  final UpdateAdapter<Pokemon> _pokemonUpdateAdapter;

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    return _queryAdapter.queryList('SELECT * FROM Pokemon',
        mapper: (Map<String, Object?> row) => Pokemon(
            row['id'] as int,
            row['shortName'] as String,
            row['name'] as String,
            (row['selected'] as int) != 0,
            (row['captured'] as int) != 0));
  }

  @override
  Future<List<Pokemon>> getAllCapturedPokemons() async {
    return _queryAdapter.queryList('SELECT * FROM Pokemon WHERE captured',
        mapper: (Map<String, Object?> row) => Pokemon(
            row['id'] as int,
            row['shortName'] as String,
            row['name'] as String,
            (row['selected'] as int) != 0,
            (row['captured'] as int) != 0));
  }

  @override
  Stream<List<Pokemon>> watchAllPokemons() {
    return _queryAdapter.queryListStream('SELECT * FROM Pokemon',
        mapper: (Map<String, Object?> row) => Pokemon(
            row['id'] as int,
            row['shortName'] as String,
            row['name'] as String,
            (row['selected'] as int) != 0,
            (row['captured'] as int) != 0),
        queryableName: 'Pokemon',
        isView: false);
  }

  @override
  Future<Pokemon?> getPokemonByShortName(String shortName) async {
    return _queryAdapter.query('SELECT * FROM Pokemon WHERE shortName = ?1',
        mapper: (Map<String, Object?> row) => Pokemon(
            row['id'] as int,
            row['shortName'] as String,
            row['name'] as String,
            (row['selected'] as int) != 0,
            (row['captured'] as int) != 0),
        arguments: [shortName]);
  }

  @override
  Future<Pokemon?> getPokemonById(int id) async {
    return _queryAdapter.query('SELECT * FROM Pokemon WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Pokemon(
            row['id'] as int,
            row['shortName'] as String,
            row['name'] as String,
            (row['selected'] as int) != 0,
            (row['captured'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<Pokemon?> getSelectedPokemon() async {
    return _queryAdapter.query('SELECT * FROM Pokemon WHERE selected',
        mapper: (Map<String, Object?> row) => Pokemon(
            row['id'] as int,
            row['shortName'] as String,
            row['name'] as String,
            (row['selected'] as int) != 0,
            (row['captured'] as int) != 0));
  }

  @override
  Future<void> insertPokemon(Pokemon pokemon) async {
    await _pokemonInsertionAdapter.insert(pokemon, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePokemon(Pokemon pokemon) async {
    await _pokemonUpdateAdapter.update(pokemon, OnConflictStrategy.abort);
  }
}
