class Pokemon {
  final String _id;
  final String _name;
  final String _type;
  final String _img;
  final bool _isCaptured;
  final int _maxHp;
  int _currentHp;

  Pokemon(this._id, this._name, this._type, this._img, this._isCaptured,
      this._maxHp, this._currentHp);

  String get id => this._id;

  String get name => this._name;

  String get type => this._type;

  String get img => this._img;

  bool get isCaptured => this._isCaptured;

  int get maxHp => this._maxHp;

  int get currentHp => this._currentHp;

  set currentHp(int currentHp) {
    _currentHp = currentHp;
  }
}
