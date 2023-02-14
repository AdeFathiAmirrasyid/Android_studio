import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar Get X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("SnackBar"),
                  action: SnackBarAction(
                    onPressed: () {},
                    label: "Cancel",
                  ),
                ));
              },
              child: Text("SnackBar"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar("SnackBar", "Ini Adalah Pesan",
                  // snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.grey[300]
                  );
                },
                child: Text("SnackBar Get X"))
          ],
        ),
      ),
    );
  }
}
