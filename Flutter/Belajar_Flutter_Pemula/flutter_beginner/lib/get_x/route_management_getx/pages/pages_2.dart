import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages_2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pages 2"),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.toNamed('/page_tiga');
          },
          child: Text("Next page 3"),
        ),
      ),
    );
  }
}
