import 'package:flutter/material.dart';

void main() {
  runApp(TabBarWidgetExample());
}

class TabBarWidgetExample extends StatelessWidget {
  List<Tab> myTab = [
    const Tab(
      text: "Chat",
    ),
    const Tab(
      text: "Status",
    ),
    const Tab(
      text: "Panggulan",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text("TabBar Widget"),
            bottom: TabBar(
              tabs: myTab,
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text(
                  "Text 1",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  "Text 2",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  "Text 3",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
