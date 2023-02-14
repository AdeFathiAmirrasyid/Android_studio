import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages_4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pages 4"),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.toNamed('/page_lima');
          },
          child: Text("Next page 5"),
        ),
      ),
    );
  }
}
