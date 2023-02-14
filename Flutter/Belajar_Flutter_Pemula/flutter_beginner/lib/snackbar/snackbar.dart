import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: const Text("SnackBar"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text("SnackBar"),
              backgroundColor: Colors.blue,
              behavior: SnackBarBehavior.floating,
              margin: const EdgeInsets.all(20),
              duration: const Duration(seconds: 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              action: SnackBarAction(
                onPressed: () {},
                label: "Cancel",
                textColor: Colors.black,
              ),
            ));
          },
          child: const Text("SnackBar"),
        ),
      ),
    );
  }
}
