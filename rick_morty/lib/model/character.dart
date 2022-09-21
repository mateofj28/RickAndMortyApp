

class Character {
  final int id;
  final String name;
  final String specie;

  const Character({
    required this.id,
    required this.name,
    required this.specie,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['results'][0]['id'],
      name: json['results'][0]['name'],
      specie: json['results'][0]['species'],
    );
  }

  factory Character.fromJsonById(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      specie: json['species'],
    );
  }
}
