class Move {
  final String _name;
  final String _type;
  final String _dmg;
  final double _critRate;
  final double _accuracy;
  final int _maxPp;
  int _currentPp;

  Move(this._name, this._type, this._dmg, this._critRate, this._accuracy,
      this._maxPp, this._currentPp);

  String get name => _name;

  String get type => _type;

  String get dmg => _dmg;

  double get critRate => _critRate;

  double get accuracy => _accuracy;

  int get maxPp => _maxPp;

  int get currentPp => _currentPp;

  set currentPp(int currentPp) {
    _currentPp = currentPp;
  }
}
