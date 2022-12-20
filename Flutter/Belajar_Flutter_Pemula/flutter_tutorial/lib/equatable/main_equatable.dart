import 'package:flutter/material.dart';

void main(){
  runApp(MainEquatable());
}

class MainEquatable extends StatelessWidget {
  const MainEquatable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageEquatable(),
    );
  }
}

class HomePageEquatable extends StatelessWidget {
  const HomePageEquatable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
    );
  }
}

