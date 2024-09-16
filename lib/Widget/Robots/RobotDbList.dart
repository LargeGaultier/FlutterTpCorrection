import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/RobotPersistence.dart';
import 'package:flutterlearningproject/Persistence/DatabaseHelper.dart';

class RobotDbList extends StatefulWidget {
  @override
  _RobotDbListState createState() => _RobotDbListState();
}

class _RobotDbListState extends State<RobotDbList> {
  late Future<List<RobotPersistence>> futureRobotList;
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    futureRobotList = dbHelper.getAllRobots();
  }

  // Rafraîchir l'écran après chaque ajout/suppression
  void refreshList() {
    setState(() {
      futureRobotList = dbHelper.getAllRobots();
    });
  }

  // Fonction pour ajouter un robot
  void _addRobot(RobotPersistence robot) async {
    await dbHelper.insertRobot(robot);
    refreshList(); // Rafraîchir la liste après l'ajout
  }

  // Fonction pour supprimer un robot
  void _deleteRobot(int id) async {
    await dbHelper.deleteRobot(id);
    refreshList(); // Rafraîchir la liste après la suppression
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Robots'),
      ),
      body: FutureBuilder<List<RobotPersistence>>(
        future: futureRobotList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          } else if (snapshot.hasData) {
            final robots = snapshot.data!;
            return ListView.builder(
              itemCount: robots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${robots[index].name} - ${robots[index].type} (${robots[index].year})'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteRobot(robots[index].id!),
                  ),
                );
              },
            );
          } else {
            return Text('Aucun robot trouvé');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddRobotDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Formulaire pour ajouter un robot
  void _showAddRobotDialog() {
    String name = '';
    String type = '';
    String year = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter un Robot'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nom'),
                onChanged: (value) => name = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Type'),
                onChanged: (value) => type = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Année de création'),
                onChanged: (value) => year = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addRobot(RobotPersistence(name: name, type: type, year: year));
                Navigator.of(context).pop();
              },
              child: Text('Ajouter'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
          ],
        );
      },
    );
  }
}