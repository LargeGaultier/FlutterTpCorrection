import 'package:flutter/material.dart';

class Etape1 extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Row and Column Example')),
        body: Column(
          children: [
            // Row with 3 Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
            SizedBox(height: 20),
            // Column with Text and Button
            Column(
              children: [
                Text(
                  'Hello, Flutter!',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'This is a simple text example.',
                  style: TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Click Me!'),
                ),
              ],
            ),
          ],
        ),
      );
  }
}