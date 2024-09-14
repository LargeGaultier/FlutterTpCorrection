import 'package:flutter/material.dart';
import 'package:flutterlearningproject/Domain/robot.dart';
import 'package:flutterlearningproject/Service/RobotService.dart';

class RobotFormScreen extends StatefulWidget {
  final RobotService robotService;  // Service passé en paramètre

  RobotFormScreen({required this.robotService});

  @override
  _RobotFormScreenState createState() => _RobotFormScreenState();
}

class _RobotFormScreenState extends State<RobotFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String type = '';
  String year = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter un Robot'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nom du robot'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le nom est obligatoire';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type du robot'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le type est obligatoire';
                  }
                  return null;
                },
                onSaved: (value) {
                  type = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Année de création'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'L\'année de création est obligatoire';
                  }
                  return null;
                },
                onSaved: (value) {
                  year = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Créer un nouveau robot et l'ajouter via le service
                    widget.robotService.addRobot(robot_nettoyeur(name, type, year));

                    // Retourner à l'écran précédent
                    Navigator.pop(context,true);
                  }
                },
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}