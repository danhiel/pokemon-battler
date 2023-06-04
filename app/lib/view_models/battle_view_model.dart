import 'package:app/models/battle_results_model.dart';
import 'package:app/models/pokemon_details_model.dart';
import 'package:app/services/pokemon_service.dart';
import 'package:flutter/material.dart';
import '../models/battle_info_model.dart';

class BattleViewModel extends ChangeNotifier {
  late BattleInfo _battleInfo;
  late String _dialogue;
  bool _isLoading = false;

  Future<BattleInfo> startBattle(String shortName) async {
    _battleInfo = await PokemonService.instance.startPokemonBattle(shortName);
    _dialogue = 'A wild ${_battleInfo.p2.name} has appeared!';
    return _battleInfo;
  }

  PokemonDetails get userInfo => _battleInfo.p1;

  PokemonDetails get opponentInfo => _battleInfo.p2;

  Results? get results => _battleInfo.results;

  String get dialogue => _dialogue;

  bool get isLoading => _isLoading;

  Future<BattleInfo> playMove(String moveName) async {
    _isLoading = true;
    notifyListeners();
    String move = moveName.replaceAll(' ', '').toLowerCase();
    _battleInfo = await PokemonService.instance
        .playMove(_battleInfo.guid, _battleInfo.pid, move);
    _isLoading = false;
    notifyListeners();
    return _battleInfo;
  }
}
