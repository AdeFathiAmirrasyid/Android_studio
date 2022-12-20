import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text("Sliver To Box "),
            ),
          ),
          // SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //         (context, i) => Card(
          //               child: Center(
          //                   child: Text(
          //                 "Item ke -> ${i + 1}",
          //                 style: const TextStyle(
          //                     fontSize: 22, fontWeight: FontWeight.bold),
          //               )),
          //             ),
          //         childCount: 30))

          SliverToBoxAdapter(
            child: Container(
              height: 400,
              color: Colors.grey,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.amber,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    color: Colors.red,
                  ),Container(
                    width: 150,
                    height: 150,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
