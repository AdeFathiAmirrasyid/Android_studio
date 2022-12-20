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
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 350,
            color: Colors.amber,
          ),
          const SizedBox(
            height: 10,
          ),
          AnimatedCrossFade(
              firstChild: Container(
                height: 150,
                width: 150,
                color: Colors.blue,
              ),
              secondChild: Container(
                height: 350,
                width: 50,
                color: Colors.deepPurple,
              ),
              crossFadeState:
                  click ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 800)),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            width: 350,
            color: Colors.amber,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            click = !click;
          });
        },
      ),
    );
  }
}
