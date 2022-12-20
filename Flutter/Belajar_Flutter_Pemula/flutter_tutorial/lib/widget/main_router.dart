import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/router/router_example.dart';
import 'package:flutter_tutorial/widget/router/router_galery.dart';
import 'package:flutter_tutorial/widget/router/router_photo.dart';

void main() {
  runApp(MainRouter());
}

class MainRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const RouterExample(),
      initialRoute: '/homerouter',
      routes: {
        '/routerexample': (context) => RouterExample(),
        '/routergalery': (context) => RouterGaleri(),
        '/routerphoto': (context) => RouterPhoto(),
      },
    );
  }
}
