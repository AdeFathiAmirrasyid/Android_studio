import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages_3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pages 3"),),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.toNamed('/page_empat');
          },
          child: Text("Next page 4"),
        ),
      ),
    );
  }
}
