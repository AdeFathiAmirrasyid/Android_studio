import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/counter_controller.dart';

void main() {
  runApp(DasarTwoGetXApp());
}

class DasarTwoGetXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Get X Dasar"),
        ),
        body: Center(
          child: GetX<CounterControllerDasarGetX>(
              init: CounterControllerDasarGetX(),
              builder: (controller) => Text(
                    "Angka ${controller.count}",
                    style: const TextStyle(fontSize: 35),
                  )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<CounterControllerDasarGetX>().increment();
          },
        ),
      ),
    );
  }
}
