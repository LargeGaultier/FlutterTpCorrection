import 'package:flutter/material.dart';

class Etape2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Stack and Positioned Example')),
        body: Center(
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 300,
                color: Colors.blue,
              ),
              Positioned(
                top: 50,
                left: 50,
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.green,
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
    
  }
}