import 'package:flutter/material.dart';

import '../widgets/widget_counter.dart';

class CounterPage extends StatefulWidget {
  static const routeName = "/counter-page";

  CounterPage({super.key}) {
    print("==========================");
    print("constructor Counter Page");
  }

  @override
  State<CounterPage> createState() {
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  void didChangeDependencies() {
    int? numberState = ModalRoute.of(context)?.settings.arguments as int?;
   if(numberState != null){
     counter = numberState;
   }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
      ),
      body: WidgetCounter(counter: counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
