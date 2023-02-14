import 'package:flutter/material.dart';
class SecondScreenWithData extends StatelessWidget {
  final String? data;
  const SecondScreenWithData(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen With Data")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data!),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, '/');
              },
              child: const Text("back"),
            ),
          ),
        ],
      ),
    );
  }
}