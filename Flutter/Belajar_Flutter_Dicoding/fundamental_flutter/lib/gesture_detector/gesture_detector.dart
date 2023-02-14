import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double boxSize = 150.0;
  int numTaps = 0;
  int numDoubleTaps = 0;
  int longPressTaps = 0;

  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      maCenter(context);
    }
    return Scaffold(
      appBar: AppBar(title: const Text("Gesture Detector")),
      body: Stack(
        children: [
          Positioned(
              top: posY,
              left: posX,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    numTaps++;
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    numDoubleTaps++;
                  });
                },
                onLongPress: () {
                  setState(() {
                    longPressTaps++;
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    double deltaX = details.delta.dx;
                    double deltaY = details.delta.dy;
                    posX += deltaX;
                    posY += deltaY;
                  });
                },
                child: Container(
                  width: boxSize,
                  height: boxSize,
                  decoration: const BoxDecoration(color: Colors.red),
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Taps: "$numTaps" - Double Taps: "$numDoubleTaps" - Long Press: "$longPressTaps"',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  void maCenter(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      posX = posX;
      posY = posY;
    });
  }
}
