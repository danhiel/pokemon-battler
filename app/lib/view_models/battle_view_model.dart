import 'package:app/models/pokemon_details_model.dart';
import 'package:app/services/pokemon_service.dart';
import 'package:flutter/material.dart';
import '../models/battle_info_model.dart';

class BattleViewModel extends ChangeNotifier {
  late BattleInfo battleInfo;
  late String guid;
  late String pid;
  late PokemonDetails user;
  late PokemonDetails opponent;
  bool _isLoading = false;

  Future<BattleInfo> startBattle(String shortName) async {
    final battleInfo =
        await PokemonService.instance.startPokemonBattle(shortName);
    guid = battleInfo.guid;
    pid = battleInfo.pid;
    user = battleInfo.p1;
    opponent = battleInfo.p2;
    return battleInfo;
  }

  PokemonDetails get userInfo => user;

  PokemonDetails get opponentInfo => opponent;

  bool get isLoading => _isLoading;

  Future<BattleInfo> playMove(String moveName) async {
    _isLoading = true;
    notifyListeners();
    String move = moveName.replaceAll(' ', '').toLowerCase();
    BattleInfo battleInfo =
        await PokemonService.instance.playMove(guid, pid, move);
    user = battleInfo.p1;
    opponent = battleInfo.p2;
    _isLoading = false;
    notifyListeners();
    return battleInfo;
  }
}
