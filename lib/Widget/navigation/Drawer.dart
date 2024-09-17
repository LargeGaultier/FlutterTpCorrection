import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';
import 'package:flutterlearningproject/Widget/Capteurs/CameraPage.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotDbList.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotListAsync.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotListWithAdd.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotListstatefull.dart';
import 'package:flutterlearningproject/Widget/Robots/robotStream.dart';
import 'package:flutterlearningproject/Widget/Robots/robotlist.dart';
import 'package:flutterlearningproject/Widget/backendinteraction/CarMakesScreen.dart';
import 'package:flutterlearningproject/Widget/navigation/HomeScreen.dart';
import 'package:flutterlearningproject/Widget/positionnement/etape1.dart';
import 'package:flutterlearningproject/Widget/positionnement/etape2.dart';
import 'package:flutterlearningproject/Widget/positionnement/etape3.dart';
import 'package:flutterlearningproject/Widget/positionnement/etape4.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotListNavigation.dart';

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sélecteur de TP'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Sélection des TP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
             ListTile(
              leading: Icon(Icons.list),
              title: Text('Positionnement Etape 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Etape1()), // Remplace par la classe de ton TP
                );
              },
            ),
             ListTile(
              leading: Icon(Icons.list),
              title: Text('Positionnement Etape 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Etape2()), // Remplace par la classe de ton TP
                );
              },
            ),
             ListTile(
              leading: Icon(Icons.list),
              title: Text('Positionnement Etape 3'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Etape3()), // Remplace par la classe de ton TP
                );
              },
            ),
             ListTile(
              leading: Icon(Icons.list),
              title: Text('Positionnement Etape 4'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Etape4()), // Remplace par la classe de ton TP
                );
              },
            ),
              ListTile(
              leading: Icon(Icons.list),
              title: Text('TP Liste Robot'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotList(robotnettoyeurList: [
                    robot_nettoyeur("Robot 1", "Model 1", "1985"),
                    robot_nettoyeur("Robot 2", "Model 2", "1986"),
                    robot_nettoyeur("Robot 3", "Model 3", "1987")],)),
                );
              },
            ),
              ListTile(
              leading: Icon(Icons.list),
              title: Text('TP Liste Robot Navigation'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotListNavigation())
                  ); 
              },
            ),
              ListTile(
              leading: Icon(Icons.list),
              title: Text('TP Liste Robot statefull'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotListStateFull(robotnettoyeurList: [
                    robot_nettoyeur("Robot 1", "Model 1", "1985"),
                    robot_nettoyeur("Robot 2", "Model 2", "1986"),
                    robot_nettoyeur("Robot 3", "Model 3", "1987")]))
                  ); 
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('TP Liste Robot DB'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotDbList()), // Remplace par la classe de ton TP
                );
              },
            ),
              ListTile(
              leading: Icon(Icons.list),
              title: Text('TP Liste Robot Async'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotListScreenAsync()), // Remplace par la classe de ton TP
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text('TP Ajout Robot'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotListWithAdd()), // Remplace par la classe de ton TP
                );
              },
            ),
             ListTile(
              leading: Icon(Icons.add_box),
              title: Text('TP Robot stream'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RobotStreamScreen()), // Remplace par la classe de ton TP
                );
              },
            ),
           
            ListTile(
              leading: Icon(Icons.car_repair),
              title: Text('TP API Car Makes'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CarMakesScreen()), // Remplace par la classe de ton TP
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('TP Home Screen'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()), // Remplace par la classe de ton TP
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenue dans le sélecteur de TP'),
      ),
    );
  }
}

class RobotStream {
}