import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Service/RobotService.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotFormScreen.dart';

class RobotListWithAdd extends StatefulWidget {
  @override
  _RobotListWithAddState createState() => _RobotListWithAddState();
}

class _RobotListWithAddState extends State<RobotListWithAdd> {
  final RobotService robotService = RobotService();  // Instance du service

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Robots'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: robotService.getRobots().length,
              itemBuilder: (context, index) {
                final robot = robotService.getRobots()[index];
                return ListTile(
                  title: Text('${robot.name} - ${robot.type} (${robot.year})'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                // Ouvrir le formulaire d'ajout
               final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RobotFormScreen(robotService: robotService),
                  ),
                );
                // Si un robot a été ajouté, rafraîchir l'interface
                if (result == true) {
                  setState(() {}); // Force le rafraîchissement de la liste
                }
              },
              child: Text('Ajouter un Robot'),
            ),
          ),
        ],
      ),
    );
  }
}