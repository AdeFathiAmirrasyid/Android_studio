import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(SnackBarApp());
}

class SnackBarApp extends StatelessWidget {
  const SnackBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Snack Bar GET X"),),body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times"),
            Text("0")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.snackbar("judul", "pesan",
          animationDuration: Duration(milliseconds: 200),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.amber,
            backgroundGradient: LinearGradient(colors: [
              Colors.deepPurple,
              Colors.blueAccent,
            ]),
            borderColor: Colors.red,
            borderWidth: 5,
            onTap: (_) => print("Di click"),
            icon: Icon(Icons.ac_unit),
            shouldIconPulse: false
            // snackPosition: SnackPosition.BOTTOM

          );
        },
        child: Icon(Icons.add),
      ),
      ),
    );
  }
}
