import 'package:flutter/material.dart';

class Etape3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Align Example')),
        body: Container(
          width: 300,
          height: 300,
          color: Colors.grey[300],
          child: const Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Left',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Bottom Right',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      );
  }
}