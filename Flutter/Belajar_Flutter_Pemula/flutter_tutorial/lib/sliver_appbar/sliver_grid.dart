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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            // collapsedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text("Sliver Presistent Header"),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.amber[100 * (index % 9)],
              );
            }, childCount: 50),
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 3,
            //     // childAspectRatio: 12 / 7
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100, // ukuran lebar layar (widht) 400 - 500
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            childAspectRatio: 12 / 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blueAccent),
            ],
          ),

          SliverGrid.extent(maxCrossAxisExtent: 427,
          children: [
            Container(color: Colors.red),
            Container(color: Colors.green),
          ],)
        ],
      ),
    );
  }
}
