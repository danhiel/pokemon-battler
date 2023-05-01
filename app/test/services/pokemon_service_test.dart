import 'package:app/services/pokemon_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pokemon service integration test', () {
    test('getAllPokemonNames should return 200', () async {
      var names = await getAllPokemonNames();

      expect(names.statusCode, 200);
      expect(names.body.length, greaterThan(0));
    });

    test('getPokemonNames should return 400 when invalid pokemon name',
        () async {
      var names = await getPokemonDetails('Dummy');

      expect(names.statusCode, 400);
      expect(names.body.length, greaterThan(0));
    });

    test('getPokemonNames should return 200', () async {
      var names = await getPokemonDetails('Pikachu');

      expect(names.statusCode, 200);
      expect(names.body.length, greaterThan(0));
    });
  });
}
