class Move {
  final String name;
  final String type;
  final int? dp;

  Move({required this.name, required this.type, required this.dp});

  factory Move.fromJson(Map<String, dynamic> json) {
    return Move(name: json['name'], type: json['type'], dp: json['dp']);
  }
}
