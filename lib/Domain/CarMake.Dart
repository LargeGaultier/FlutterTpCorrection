class CarMake {
  final String makeId;
  final String makeName;

  CarMake({required this.makeId, required this.makeName});

  // Méthode pour créer un CarMake à partir d'un JSON
  factory CarMake.fromJson(Map<String, dynamic> json) {
    return CarMake(
      makeId: json['Make_ID'].toString(),
      makeName: json['Make_Name'],
    );
  }
}
