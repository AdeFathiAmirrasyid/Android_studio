import 'dart:math';

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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Builder"),
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _controller,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
          child: const Center(
            child: Text("Whee!"),
          ),
        ),
        builder: (BuildContext context, Widget? chid) {
          return Transform.rotate(angle: _controller.value * 2.0 * pi, child: chid,);
        },
      )),
    );
  }
}
