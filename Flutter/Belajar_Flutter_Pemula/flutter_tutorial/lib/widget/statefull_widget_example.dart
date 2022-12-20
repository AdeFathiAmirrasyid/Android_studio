import 'package:flutter/material.dart';

void main() {
  runApp(const StatelessWidgetExample());
}

class StatelessWidgetExample extends StatefulWidget {
  const StatelessWidgetExample({super.key});

  @override
  State<StatelessWidgetExample> createState() => _StatelessWidgetExampleState();
}

class _StatelessWidgetExampleState extends State<StatelessWidgetExample> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Statefull Widget Example"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(counter.toString(), style: TextStyle(fontSize: 20 + double.parse(counter.toString())),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (counter != 0) {
                          counter--;
                        }
                      });
                    },
                    child: const Icon(Icons.remove)),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: const Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
