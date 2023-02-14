import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller_binding.dart';

class PageBindings extends StatelessWidget {

  final myC = Get.find<ControllerBindings>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter App"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${myC.counter}", style: const TextStyle(fontSize: 60),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(onPressed: (){
                  myC.decrement();
                }, child: const Text("-")),
                ElevatedButton(onPressed: (){
                  myC.increment();
                }, child: const Text("+")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
