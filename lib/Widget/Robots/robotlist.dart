import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';

class RobotList extends StatelessWidget {
  final List<robot_nettoyeur> robotnettoyeurList;
  final List<int> colorCodes = <int>[600, 500, 100];
  RobotList({required this.robotnettoyeurList});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(  
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: robotnettoyeurList.length,
      itemBuilder: (context, int index) {
        return Container(
        height: 50,
        color: Colors.amber[colorCodes[index]],
        child: Center(child: Text('${robotnettoyeurList[index].name} ${robotnettoyeurList[index].model} ${robotnettoyeurList[index].year}')),
      );
      },
    );
  }
}