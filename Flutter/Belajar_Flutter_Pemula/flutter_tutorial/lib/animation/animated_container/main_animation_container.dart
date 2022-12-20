import 'package:flutter/material.dart';

void main(){
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
        child: GestureDetector(
          onTap: () {
            setState(() {
              click = !click;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 2),
            width: click ? 100 : 300,
            height: click ? 500 : 100,
            color: Colors.amber,
            curve: Curves.fastOutSlowIn,
            alignment: click ? Alignment.topCenter : Alignment.centerRight,
            child: const Icon(Icons.android, size: 50,),
          ),
        ),
      ),
    );
  }
}

