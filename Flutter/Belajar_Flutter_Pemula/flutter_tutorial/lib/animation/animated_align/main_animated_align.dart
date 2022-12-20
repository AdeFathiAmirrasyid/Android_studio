import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          color: Colors.amber,
          child: AnimatedAlign(
            duration: Duration(seconds: 2),
          alignment: click ? Alignment.topLeft : Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  click = !click;
                });
              },
              child: const Icon(
                Icons.ac_unit,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
