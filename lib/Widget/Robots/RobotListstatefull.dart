import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';

class RobotListStateFull extends StatefulWidget {
  final List<robot_nettoyeur> robotnettoyeurList;

  const RobotListStateFull({required this.robotnettoyeurList});

  @override
  _RobotListState createState() => _RobotListState();
}

class _RobotListState extends State<RobotListStateFull> {
  List<robot_nettoyeur> robotList = [];

  @override
  void initState() {
    super.initState();
    robotList = widget.robotnettoyeurList; // Initialize the list from the constructor
  }

  final List<int> colorCodes = <int>[600, 500, 100];

  void addRobot() {
    setState(() {
      // Add a new robot to the list
      robotList.add(robot_nettoyeur('New Robot', 'Model X', '2024'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: robotList.length,
              itemBuilder: (context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber[colorCodes[index % colorCodes.length]],
                  child: Center(
                    child: Text(
                        '${robotList[index].name} ${robotList[index].model} ${robotList[index].year}'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: addRobot,
              child: Text('Ajouter un Robot'),
            ),
          ),
        ],
      ),
    );
  }
}
