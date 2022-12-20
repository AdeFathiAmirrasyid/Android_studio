import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 350,
            height: 350,
            child: Stack(
              children: [
                Container(
                  width: 350,
                  height: 350,
                  color: Colors.amber,
                  child: Center(child: Text("Hello", style: TextStyle(fontSize: 35),)),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  top: click ? 100 : 150,
                  left: 100,
                  child: Container(
                    width: 150,
                    height: 50,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              click = !click;
            });
          },
        ),
      ),
    );
  }
}
