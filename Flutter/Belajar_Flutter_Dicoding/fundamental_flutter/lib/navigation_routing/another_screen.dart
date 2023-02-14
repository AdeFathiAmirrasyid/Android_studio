import 'package:flutter/material.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Another Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Back to First Screen"),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            }, child: const Text("Back"))
          ],
        ),
      ),
    );
  }
}
