import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';

class RobotDetailPage extends StatelessWidget {
  final robot_nettoyeur robot;

  RobotDetailPage({required this.robot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails du robot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom: ${robot.name}', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('Modèle: ${robot.model}', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('Année: ${robot.year}', style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}