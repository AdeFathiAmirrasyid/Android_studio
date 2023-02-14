import 'package:flutter/material.dart';

class ReturnDataAnotherScreen extends StatefulWidget {
  const ReturnDataAnotherScreen({super.key});

  @override
  State<ReturnDataAnotherScreen> createState() =>
      _ReturnDataAnotherScreenState();
}

class _ReturnDataAnotherScreenState extends State<ReturnDataAnotherScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Data From Another Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, textEditingController.text);
                },
                child: const Text("Send"))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
