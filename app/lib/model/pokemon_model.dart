import 'package:app/model/move_model.dart';

class Pokemon {
  final String _id;
  final String _name;
  final String _type;
  final String _img;
  final bool _isCaptured;
  final int _maxHp;
  final List<Move> _moves;
  int _currentHp;

  Pokemon(this._id, this._name, this._type, this._img, this._isCaptured,
      this._moves, this._maxHp, this._currentHp);

  String get id => _id;

  String get name => _name;

  String get type => _type;

  String get img => _img;

  bool get isCaptured => _isCaptured;

  List<Move> get moves => _moves;

  int get maxHp => _maxHp;

  int get currentHp => _currentHp;

  set currentHp(int currentHp) {
    _currentHp = currentHp;
  }
}
