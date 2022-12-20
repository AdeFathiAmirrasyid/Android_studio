import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(const CupertinoDatePicker());
}

class CupertinoDatePicker extends StatelessWidget {
  const CupertinoDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageCupertinoDatePicker(),
    );
  }
}

class PageCupertinoDatePicker extends StatelessWidget {
  const PageCupertinoDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cupertino"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2050));
          },
          child: const Text(
            "Date Picker",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
