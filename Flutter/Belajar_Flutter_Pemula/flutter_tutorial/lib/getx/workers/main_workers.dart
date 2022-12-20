import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/my_controller_workers.dart';

void main() {
  runApp(MainWorkersApp());
}

class MainWorkersApp extends StatelessWidget {
  const MainWorkersApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWorkers(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageWorkers extends StatelessWidget {
  final myC = Get.put(MyControllerWorkers());
  HomePageWorkers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workers"),
        actions: [IconButton(onPressed: () => myC.reset(), icon: Icon(Icons.refresh))],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                    "Terjadi Sesuatu : ${myC.count} x",
                    style: TextStyle(fontSize: 25),
                  )),
              const SizedBox(
                height: 30,
              ),
              TextField(
                onChanged: (_) => myC.change(),
                decoration: InputDecoration(border: OutlineInputBorder()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
