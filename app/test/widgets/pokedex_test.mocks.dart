// Mocks generated by Mockito 5.4.0 from annotations
// in app/test/widgets/pokedex_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i5;

import 'package:app/database/pokemon_entity.dart' as _i3;
import 'package:app/view_models/pokedex_view_model.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [PokedexViewModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokedexViewModel extends _i1.Mock implements _i2.PokedexViewModel {
  MockPokedexViewModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i3.Pokemon> get allPokemons => (super.noSuchMethod(
        Invocation.getter(#allPokemons),
        returnValue: <_i3.Pokemon>[],
      ) as List<_i3.Pokemon>);
  @override
  List<_i3.Pokemon> get allCapturedPokemons => (super.noSuchMethod(
        Invocation.getter(#allCapturedPokemons),
        returnValue: <_i3.Pokemon>[],
      ) as List<_i3.Pokemon>);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  void watchPokedex() => super.noSuchMethod(
        Invocation.method(
          #watchPokedex,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.Pokemon? getPokemonByShortName(String? shortName) =>
      (super.noSuchMethod(Invocation.method(
        #getPokemonByShortName,
        [shortName],
      )) as _i3.Pokemon?);
  @override
  _i4.Future<void> setSelectedPokemon({
    _i3.Pokemon? pokemon,
    String? shortName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setSelectedPokemon,
          [],
          {
            #pokemon: pokemon,
            #shortName: shortName,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> setCapturedPokemon({
    required bool? isCaptured,
    _i3.Pokemon? pokemon,
    String? shortName,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setCapturedPokemon,
          [],
          {
            #isCaptured: isCaptured,
            #pokemon: pokemon,
            #shortName: shortName,
          },
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> insertPokemon(_i3.Pokemon? pokemon) => (super.noSuchMethod(
        Invocation.method(
          #insertPokemon,
          [pokemon],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> reset() => (super.noSuchMethod(
        Invocation.method(
          #reset,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void addListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
