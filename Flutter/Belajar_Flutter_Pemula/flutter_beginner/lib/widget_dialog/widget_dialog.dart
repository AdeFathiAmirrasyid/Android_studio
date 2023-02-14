import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      title: const Text("Peringatan"),
                      content: const Text(
                          "is simply dummy text of the printing and typesetting industry."),
                      actions: [
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Ya"))
                      ],
                    ));
          },
          child: const Text("Show Dialog"),
        ),
      ),
    );
  }
}
