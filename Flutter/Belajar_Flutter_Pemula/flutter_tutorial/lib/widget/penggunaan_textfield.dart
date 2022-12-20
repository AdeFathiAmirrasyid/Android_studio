import 'package:flutter/material.dart';

void main() {
  runApp(PenggunaanTextField());
}

class PenggunaanTextField extends StatefulWidget {
  @override
  State<PenggunaanTextField> createState() => _PenggunaanTextFieldState();
}

class _PenggunaanTextFieldState extends State<PenggunaanTextField> {
  final TextEditingController myController = TextEditingController();

  String result = "HASIL INPUT";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Penggunaan TextField"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: myController,
                  onChanged: (value) {
                    print("ON CHANGE");
                  },
                  onSubmitted: (value) {
                    setState(() {
                      result = value;
                    });
                  },
                  onEditingComplete: () {
                    print("EDIT SUCCESS");
                  },
                ),
                Text(result),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
