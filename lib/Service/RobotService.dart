import 'package:flutterlearningproject/Domain/robot.dart';

class RobotService {
  Future<List<robot_nettoyeur>> fetchRobots() async {
    // Simule un délai de 5 secondes avant de retourner la liste
    await Future.delayed(Duration(seconds: 10));

    return [
      robot_nettoyeur('Robo1', 'Model A', '2020'),
      robot_nettoyeur('Robo2', 'Model B', '2021'),
      robot_nettoyeur('Robo3', 'Model C', '2022'),
    ];
  }
}