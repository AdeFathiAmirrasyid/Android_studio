import 'package:flutter/material.dart';

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliverAppBarExample(),
    );
  }
}

class SliverAppBarExample extends StatelessWidget {
  const SliverAppBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver List"),
              background: FlutterLogo(),
            ),
          ),
          SliverPrototypeExtentList(
                delegate: SliverChildBuilderDelegate((context, i) {
            return Container(
              color: Colors.red[900],
            );
          }, childCount: 1), prototypeItem: SizedBox(height: 100,))
          // SliverFixedExtentList(
          //     delegate: SliverChildBuilderDelegate((context, i) {
          //       return Container(
          //         color: Colors.amber[100 * (i % 9)],
          //       );
          //     }, childCount: 9),
          //     itemExtent: 100),
          // SliverList(delegate: SliverChildBuilderDelegate((context, i){
          //  return ListTile(
          //    leading: CircleAvatar(),
          //    title: Text("Data ke - ${i + 1}"),
          //  );
          // },
          //   childCount: 20,
          // ))
        ],
      ),
    );
  }
}
