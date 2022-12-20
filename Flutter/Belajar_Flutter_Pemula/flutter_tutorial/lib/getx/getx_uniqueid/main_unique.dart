import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(UniqueIdApp());
}

class UniqueIdApp extends StatelessWidget {
  var counterC = Get.put(CounterUniqueId());
  UniqueIdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Unique ID"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CounterUniqueId>(
                id: 'insani',
                builder: (_) => Text(
                  "insani ${counterC.counter}",
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              GetBuilder<CounterUniqueId>(
                id: 'laudiya',
                builder: (_) => Text(
                  "laudiya ${counterC.counter}",
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              GetBuilder<CounterUniqueId>(
                id: 'general',
                builder: (_) => Text(
                  "general ${counterC.counter}",
                  style: const TextStyle(fontSize: 35),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counterC.add(),
        ),
      ),
    );
  }
}

class CounterUniqueId extends GetxController {
  var counter = 0;
  void add() {
    counter++;
    update(['insani']);
  }
}
