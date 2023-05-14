import 'package:app/services/pokemon_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pokemon service integration test', () {
    test('getAllPokemonNames should return 200', () async {
      var names = await PokemonService.instance.getAllPokemonNames();

      expect(names.length, greaterThan(0));
    });

    test('getPokemonDetails should return 400 when invalid pokemon name',
        () async {
      expect(
          () async => await PokemonService.instance.getPokemonDetails('Dummy'),
          throwsException);
    });

    test('getPokemonDetails should return 200', () async {
      var details = await PokemonService.instance.getPokemonDetails('Pikachu');

      expect(details.type, 'electric');
    });
  });
}
