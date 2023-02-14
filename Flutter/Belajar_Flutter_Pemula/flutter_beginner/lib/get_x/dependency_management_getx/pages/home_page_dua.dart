import 'package:flutter/material.dart';

import '../controllers/controller_depedency.dart';
import 'package:get/get.dart';

class HomePageDua extends StatelessWidget {
  ControllerDepedency myC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page 2"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${myC.data2['name']} - ${myC.data2['age']}",
                style: const TextStyle(fontSize: 35),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("next pages"),
              ),
            ],
          ),
        ));
  }
}
