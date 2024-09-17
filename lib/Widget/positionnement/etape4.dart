import 'package:flutter/material.dart';

class Etape4  extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold(
        appBar: AppBar(title: const Text('Expanded and Flexible Example')),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    child: const Center(child: Text('Expanded 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    child: const Center(child: Text('Expanded 2')),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    child: const Center(child: Text('Expanded 3')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.orange,
                    height: 100,
                    child: Center(child: Text('Flexible 2x')),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                    height: 100,
                    child: Center(child: Text('Flexible 1x')),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}