import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = const TabBar(
      indicator: BoxDecoration(
          color: Colors.red,
          border: Border(bottom: BorderSide(color: Colors.lightBlue,width: 5))),
      tabs: [
        Tab(
          icon: Icon(Icons.comment),
          text: "Comment",
        ),
        Tab(
          icon: Icon(Icons.computer),
          text: "Computer",
        )
      ],
    );
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Contoh Tab Bar"),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                child: Container(
                  color: Colors.amber,
                  child: myTabBar,
                ),
              )),
          body: const TabBarView(
            children: [
              Center(
                child: Text("Tab 1"),
              ),
              Center(
                child: Text("Tab 2"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
