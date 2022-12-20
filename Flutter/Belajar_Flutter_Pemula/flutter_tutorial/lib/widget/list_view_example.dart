import 'package:flutter/material.dart';

void main() {
  runApp(ListViewExample());
}

class ListViewExample extends StatelessWidget {
  final List<Color> myList = [
    Colors.red,
    Colors.greenAccent,
    Colors.amber,
    Colors.blueAccent
  ];
  ListViewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
        ),
        body: ListView.separated(
          // scrollDirection: Axis.horizontal,
          itemCount: myList.length,
          itemBuilder: (context, index) => Container(
            width: 300,
            height: 300,
            color: myList[index],
          ),
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              color: Colors.black54,
            );
          },
        ),
      ),
    );
  }
}
