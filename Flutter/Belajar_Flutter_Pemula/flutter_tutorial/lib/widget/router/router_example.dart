import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/router/router_galery.dart';

class RouterExample extends StatelessWidget {
  const RouterExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning Router"),
      ),
      body: const Center(
        child: Text(
          "Home Router",
          style: TextStyle(fontSize: 50, fontFamily: 'Viga'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/routergalery');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
