import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotListAsync.dart';
import 'package:flutterlearningproject/Widget/Robots/RobotListNavigation.dart';
import 'package:flutterlearningproject/Widget/positionnement/etape1.dart';
import 'package:flutterlearningproject/Widget/positionnement/etape2.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of pages to navigate
  static final List<Widget> _pages = <Widget>[
    Etape1(),
    Etape2(),
    RobotListNavigation(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Etape 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
          label: 'Etape 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Liste de robot',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}