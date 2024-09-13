import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';
import 'package:flutterlearningproject/Service/RobotService.dart';

class RobotListScreenAsync extends StatefulWidget {
  @override
  _RobotListScreenState createState() => _RobotListScreenState();
}

class _RobotListScreenState extends State<RobotListScreenAsync> {
  late Future<List<robot_nettoyeur>> futureRobots;

  @override
  void initState() {
    super.initState();
    // Appel de la fonction asynchrone pour récupérer les robots
    futureRobots = RobotService().fetchRobots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Robot List'),
      ),
      body: FutureBuilder<List<robot_nettoyeur>>(
        future: futureRobots,
        builder: (context, snapshot) {
          // Si l'opération est en cours
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Si une erreur est survenue
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }

          // Quand les données sont prêtes
          if (snapshot.hasData) {
            final robots = snapshot.data!;
            return ListView.builder(
              itemCount: robots.length,
              itemBuilder: (context, index) {
                final robot = robots[index];
                return ListTile(
                  title: Text('${robot.name} - ${robot.model} (${robot.year})'),
                );
              },
            );
          }

          return Container(); // Si aucun des états n'est atteint
        },
      ),
    );
  }
}