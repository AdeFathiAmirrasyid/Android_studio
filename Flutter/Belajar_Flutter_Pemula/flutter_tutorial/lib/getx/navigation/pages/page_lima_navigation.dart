import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageLimaNavigation extends StatelessWidget {
  const PageLimaNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page navigation 5"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Get.back(), child: Text("<< Back Page"))
          ],
        ),
      ),
    );
  }
}
