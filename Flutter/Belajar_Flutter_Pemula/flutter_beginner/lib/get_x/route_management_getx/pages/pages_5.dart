import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pages_5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pages 5"),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Get.offAllNamed("/home");
              },
              child: Text("Back To Home"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.offAllNamed("/page_satu");
              },
              child: Text("Back page 1"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.offAllNamed("/page_tiga");
              },
              child: Text("Back page 3"),
            ),
          ],
        ),
      ),
    );
  }
}
