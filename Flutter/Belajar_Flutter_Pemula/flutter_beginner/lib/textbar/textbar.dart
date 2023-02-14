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

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FaceChat"),
        bottom:  TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              child: Text("Chat"),
            ),
            Tab(
              child: Text("Status"),
            ),
            Tab(
              child: Text("Panggilan"),
            ),
          ],
        ),
      ),
      body:  TabBarView(
        controller: tabController,
        children: const [
          Center(child: Text("Chat")),
          Center(child: Text("Status")),
          Center(child: Text("Panggilan")),
        ],
      ),
    );
  }
}
