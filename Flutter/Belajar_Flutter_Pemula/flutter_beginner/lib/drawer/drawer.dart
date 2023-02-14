import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              height: 150,
              color: Colors.blue,
              child: const Text(
                "Menu Dashboard",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) => const ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
