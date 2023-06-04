import 'package:app/models/battle_results_model.dart';
import 'package:app/models/pokemon_details_model.dart';
import 'package:app/services/pokemon_service.dart';
import 'package:flutter/material.dart';
import '../models/battle_info_model.dart';

class BattleViewModel extends ChangeNotifier {
  late BattleInfo _battleInfo;
  late PokemonDetails _p1;
  late PokemonDetails _p2;
  late String _dialogue;
  bool _isLoading = false;

  Future<BattleInfo> startBattle(String shortName) async {
    _battleInfo = await PokemonService.instance.startPokemonBattle(shortName);
    _p1 = _battleInfo.p1;
    _p2 = _battleInfo.p2;
    _dialogue = 'A wild ${_battleInfo.p2.name} has appeared!';
    return _battleInfo;
  }

  PokemonDetails get userInfo => _p1;

  PokemonDetails get opponentInfo => _p2;

  Results? get results => _battleInfo.results;

  String get dialogue => _dialogue;

  bool get isLoading => _isLoading;

  Future<BattleInfo> playMove(String moveName) async {
    _isLoading = true;
    _dialogue = '';
    notifyListeners();

    String move = moveName.replaceAll(' ', '').toLowerCase();
    _battleInfo = await PokemonService.instance
        .playMove(_battleInfo.guid, _battleInfo.pid, move);

    await _playP1Move();
    await _playP2Move();

    _isLoading = false;
    notifyListeners();

    return _battleInfo;
  }

  Future<void> _playP1Move() async {
    final results = _battleInfo.results!;
    if (results.p1Move == 'flee') {
      await _triggerFlee();
      return;
    } else if (results.p1Move == null) {
      return;
    }
    _dialogue = '${_p1.name} used ${results.p1Move}!';
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    _dialogue =
        '${results.p1Move} ${results.p1Result == 'hit' ? 'landed' : 'missed'}.';
    _p2 = _battleInfo.p2;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> _triggerFlee() async {
    _dialogue = '${_p1.name} ran away.';
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    _p1 = _battleInfo.p1;
    _dialogue = '${_p1.name} ${_battleInfo.results!.p1Result}.';
    notifyListeners();
  }

  Future<void> _playP2Move() async {
    final results = _battleInfo.results!;
    if (results.p2Move == null) {
      return;
    }
    _dialogue = '${_p2.name} used ${results.p2Move}!';
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    _dialogue =
        '${results.p2Move} ${results.p2Result == 'hit' ? 'landed' : 'missed'}.';
    _p1 = _battleInfo.p1;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
  }
}
