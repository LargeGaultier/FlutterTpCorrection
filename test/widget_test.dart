
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlearningproject/Domain/robot.dart'; // Assurez-vous d'utiliser le bon chemin d'import

void main() {
  group('robot_nettoyeur tests', () {
    test('Initial isCleaning should be false', () {
      final robot = robot_nettoyeur('Robo1', 'Model A', '2020');
      
      // Vérifie que la propriété isCleaning est false au début
      expect(robot.isCleaning, isFalse);
    });

    test('Clean method should set isCleaning to true', () {
      final robot = robot_nettoyeur('Robo1', 'Model A', '2020');
      
      // Appelle la méthode Clean et vérifie que isCleaning devient true
      robot.Clean();
      expect(robot.isCleaning, isTrue);
    });

    test('StopCleaning method should set isCleaning to false', () {
      final robot = robot_nettoyeur('Robo1', 'Model A', '2020');
      
      // Appelle la méthode Clean, puis StopCleaning
      robot.Clean();
      robot.StopCleaning();
      
      // Vérifie que isCleaning est false après l'appel de StopCleaning
      expect(robot.isCleaning, isFalse);
    });
  });
}
