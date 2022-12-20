import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widget_lifecycle/pages/other_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(LifecycleApp());
}

class LifecycleApp extends StatelessWidget {
  const LifecycleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageLifecycle(),
    );
  }
}

class HomePageLifecycle extends StatelessWidget {
  final countC = Get.put(CounterControllerLifecycle());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => OtherPage(),
                  )),
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: CountWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countC.add();
        },
      ),
    );
  }
}

class CountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CounterControllerLifecycle>(
        initState: (_) => print("initState"),
        didChangeDependencies: (_) => print("didChangeDependencies"),
        didUpdateWidget: (oldWidget, state) => print("idUpdate"),
        dispose: (state) => print("dispose"),
        builder: (c) => Text("Angka ${c.count}"));
  }
}

class CounterControllerLifecycle extends GetxController {
  var count = 0;
  void add() {
    count++;
    update();
  }
}
