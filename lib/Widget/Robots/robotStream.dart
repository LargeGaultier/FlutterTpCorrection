import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';
import 'package:flutterlearningproject/Service/RobotService.dart';

class RobotStreamScreen extends StatefulWidget {
  @override
  _RobotStreamScreenState createState() => _RobotStreamScreenState();
}

class _RobotStreamScreenState extends State<RobotStreamScreen> {
  final List<robot_nettoyeur> robotList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream of Robots'),
      ),
      body: StreamBuilder<robot_nettoyeur>(
        stream: RobotService().generateRobots(),
        builder: (context, snapshot) {
          // Si le Stream est en attente
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Quand des robots sont émis par le Stream
          if (snapshot.hasData) {
            robotList.add(snapshot.data!); // Ajoute le robot à la liste
          }

          return ListView.builder(
            itemCount: robotList.length,
            itemBuilder: (context, index) {
              final robot = robotList[index];
              return ListTile(
                title: Text('${robot.name} - ${robot.model} (${robot.year})'),
              );
            },
          );
        },
      ),
    );
  }
}