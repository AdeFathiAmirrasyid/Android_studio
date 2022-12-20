import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const DialogBarApp());
}

class DialogBarApp extends StatelessWidget {
  const DialogBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dialog Get X"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("You have pushed the button this many times"),
              Text("0")
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              barrierDismissible: false,
              title: "ini judul",
              middleText: "Ini description",
              textCancel: "Batal",
              onCancel: (){
                Get.back();
              },
              textConfirm: "Okey",
              onConfirm: (){
                Get.back();
                Get.to(() => const OtherClass());
              },
              confirmTextColor: Colors.white
            );
            // Get.defaultDialog(
            //   barrierDismissible: false,
            //   title: "ini judul",
            //   middleText: "ini description",
            //   // default bawaan
            //   textCancel: "Batal",
            //   cancelTextColor: Colors.pink,
            //   onCancel: () {},
            //
            //   // custom cancel widget
            //   cancel: ElevatedButton(onPressed: () {
            //     Get.back();
            //   }, child: const Text("Batalkan")),
            //
            //   // custom
            //   confirm: ElevatedButton(onPressed: (){}, child: const Text("Okey")),
            //
            //   //Bawaan
            //   textConfirm: "oke confirm",
            //   confirmTextColor: Colors.red,
            //   onConfirm: (){},
            //
            //   backgroundColor: Colors.amber,
            //   radius: 100,
            //
            //
            // );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class OtherClass extends StatelessWidget {
  const OtherClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman other"),),
    );
  }
}

