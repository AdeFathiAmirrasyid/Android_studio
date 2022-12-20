import 'package:flutter/material.dart';

void main() {
  runApp(MainShowDialog());
}

class MainShowDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowDialogExample(),
    );
  }
}

class ShowDialogExample extends StatefulWidget {
  @override
  State<ShowDialogExample> createState() => _ShowDialogExampleState();
}

class _ShowDialogExampleState extends State<ShowDialogExample> {
  String data = "Belum ada input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Dialog"),
      ),
      body: Center(
        child: Text(
          data,
          style: const TextStyle(fontSize: 30, fontFamily: 'Viga'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content: const Text("Are you sure to delete this item"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            data = "False";
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("No")),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            data = "True";
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text("Yes"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
