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

  Stream<robot_nettoyeur> generateRobots() async* {
    List<robot_nettoyeur> robots = [
      robot_nettoyeur('Robo1', 'Model A', '2020'),
      robot_nettoyeur('Robo2', 'Model B', '2021'),
      robot_nettoyeur('Robo3', 'Model C', '2022'),
      robot_nettoyeur('Robo4', 'Model D', '2023'),
    ];

    for (var robot in robots) {
      await Future.delayed(Duration(seconds: 2));
      yield robot; // Emet un robot toutes les 2 secondes
    }
  }
  List<robot_nettoyeur> getRobots() {
    return [
      robot_nettoyeur('Robo1', 'Model A', '2020'),
      robot_nettoyeur('Robo2', 'Model B', '2021'),
      robot_nettoyeur('Robo3', 'Model C', '2022'),
    ];
  }
}