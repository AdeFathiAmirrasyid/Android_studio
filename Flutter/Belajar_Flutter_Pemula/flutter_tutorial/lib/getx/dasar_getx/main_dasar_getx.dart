import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/dasar_getx/controllers/people_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(DasarGetXApp());
}

class DasarGetXApp extends StatelessWidget {
  var peopleC = Get.put(PeopleController());
  DasarGetXApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Get X Dasar"),
        ),
        body: Center(
          child: Obx(() => Text(
                "Nama Saya ${peopleC.people.value.name}",
                style: const TextStyle(fontSize: 35),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            peopleC.changeUpperCase();
          },
        ),
      ),
    );
  }
}
