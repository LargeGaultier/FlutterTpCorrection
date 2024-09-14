import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/CarMake.dart';
import 'package:flutterlearningproject/Service/CarMakeService.dart';

void main() {
  runApp(MaterialApp(home: CarMakesScreen()));
}

class CarMakesScreen extends StatefulWidget {
  @override
  _CarMakesScreenState createState() => _CarMakesScreenState();
}

class _CarMakesScreenState extends State<CarMakesScreen> {
  late Future<List<CarMake>> futureCarMakes;
  final CarMakeService carMakeService = CarMakeService();  // Instance du service

  @override
  void initState() {
    super.initState();
    // Appel du service pour récupérer les données
    futureCarMakes = carMakeService.fetchCarMakes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Industriels de Voitures'),
      ),
      body: Center(
        child: FutureBuilder<List<CarMake>>(
          future: futureCarMakes,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Afficher un loader pendant le chargement
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Afficher un message d'erreur si la requête échoue
              return Text('Erreur: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Afficher la liste des industriels
              final carMakes = snapshot.data!;
              return ListView.builder(
                itemCount: carMakes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(carMakes[index].makeName),
                  );
                },
              );
            } else {
              // Si aucun résultat (rarement atteint)
              return Text('Aucun industriel trouvé');
            }
          },
        ),
      ),
    );
  }
}
