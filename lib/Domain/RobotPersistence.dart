class RobotPersistence {
  final int? id;
  final String name;
  final String type;
  final String year;

  RobotPersistence({this.id, required this.name, required this.type, required this.year});

  // Convertir un Robot en Map pour l'ajouter à SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'year': year,
    };
  }

  // Convertir un Map en RobotPersistence (depuis SQLite)
  factory RobotPersistence.fromMap(Map<String, dynamic> map) {
    return RobotPersistence(
      id: map['id'],
      name: map['name'],
      type: map['type'],
      year: map['year'],
    );
  }

  // Pour des fins de debugging, on peut afficher le contenu du robot
  @override
  String toString() {
    return 'RobotPersistence{id: $id, name: $name, type: $type, year: $year}';
  }
}
