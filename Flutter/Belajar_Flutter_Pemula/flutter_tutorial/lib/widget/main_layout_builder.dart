import 'package:flutter/material.dart';

void main() {
  runApp(const MainLayoutBuilder());
}

class MainLayoutBuilder extends StatelessWidget {
  const MainLayoutBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageLayoutBuilder(),
    );
  }
}

class PageLayoutBuilder extends StatelessWidget {
  const PageLayoutBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingApp = MediaQuery.of(context).padding.top;

    final myAppBar = AppBar(title: const Text("Layout Builder"));
    final heightBody = heightApp - paddingApp - myAppBar.preferredSize.height;
    return Scaffold(
      appBar: myAppBar,
      body: Container(
        width: widthApp,
        height: heightBody * 0.3,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MyContainer(widthApp),
            MyContainer(widthApp),
            MyContainer(widthApp),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  double widthApp;
  MyContainer(this.widthApp);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: widthApp * 0.25,
          height: constraints.maxHeight * 0.5,
          color: Colors.indigo,
        );
      },
    );
  }
}
