import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutterlearningproject/Domain/CarMake.dart';

class CarMakeService {
  // URL de l'API
  final String apiUrl = 'https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=json';

  // Fonction pour récupérer la liste des industriels de l'API
  Future<List<CarMake>> fetchCarMakes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Décoder la réponse JSON
      final jsonData = json.decode(response.body);
      final List<dynamic> makesJson = jsonData['Results'];
      
      // Convertir chaque élément JSON en objet CarMake
      return makesJson.map((json) => CarMake.fromJson(json)).toList();
    } else {
      throw Exception('Échec de la récupération des données');
    }
  }
}