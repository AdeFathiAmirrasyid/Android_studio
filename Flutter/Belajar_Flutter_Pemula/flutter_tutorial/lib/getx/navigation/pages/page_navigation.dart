import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/navigation/pages/page_dua_navigation.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';

class PageNavigation extends StatelessWidget {
  const PageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page navigation 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.page_2,arguments: ("Send from page Navigation"));
                  // navigator!.push(MaterialPageRoute(
                  //     builder: (_) => const PageDuaNavigation()));
                },
                child: const Text("Next Page >>"))
          ],
        ),
      ),
    );
  }
}
