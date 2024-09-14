import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';
import 'package:flutterlearningproject/Service/RobotService.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotDetailPage.dart';

class RobotListNavigation extends StatelessWidget {
  final RobotService robotService = RobotService();

  @override
  Widget build(BuildContext context) {
    List<robot_nettoyeur> robots = robotService.getRobots();
    return ListView.builder(
      itemCount: robots.length,
      itemBuilder: (context, index) {
        final robot = robots[index];
        return ListTile(
          title: Text('${robot.name} - ${robot.model} (${robot.year})'),
          trailing: ElevatedButton(
            onPressed: () {
              // Navigate to detail page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RobotDetailPage(robot: robot),
                ),
              );
            },
            child: Text('Voir détails'),
          ),
        );
      },
    );
  }
}
