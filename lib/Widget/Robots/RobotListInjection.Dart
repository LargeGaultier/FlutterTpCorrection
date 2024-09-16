import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterlearningproject/Service/RobotService.dart';

class RobotListInjection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final robotService = Provider.of<RobotServiceInjection>(context); // Obtenir le service injecté

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: robotService.getAllRobots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur : ${snapshot.error}');
        } else if (snapshot.hasData) {
          final robots = snapshot.data!;
          return ListView.builder(
            itemCount: robots.length,
            itemBuilder: (context, index) {
              final robot = robots[index];
              return ListTile(
                title: Text('${robot['name']} - ${robot['type']} (${robot['year']})'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    robotService.deleteRobot(robot['id']);
                  },
                ),
              );
            },
          );
        } else {
          return const Text('Aucun robot trouvé');
        }
      },
    );
  }
}
