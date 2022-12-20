import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget/router/router_photo.dart';

void main() {
  runApp(DrawerLayout());
}

class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        '/routerphoto': (context) => RouterPhoto(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Layout"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.lightBlue,
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Menu Pilihan",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/routerphoto');
              },
              leading: const Icon(
                Icons.home,
                size: 30,
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 24),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "do something",
          style: TextStyle(fontSize: 30, fontFamily: 'Viga'),
        ),
      ),
    );
  }
}
