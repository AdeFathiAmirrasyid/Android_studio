import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
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
        title: const Text("Home Page"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              Get.to(() => const SecondPage(), arguments: "Arg From Home Page"),
          child: const Text("Second Page >>"),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${Get.arguments}"),
            Text("${Get.rawRoute}", textAlign: TextAlign.center,),
            Text("${Get.routing.current}", textAlign: TextAlign.center,),
            ElevatedButton(
              onPressed: () => Get.to(() => const OtherPage()),
              child: const Text("Other Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SOther Page"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Other Page"),
            Text(Get.previousRoute, textAlign: TextAlign.center,),
            Text("${Get.isSnackbarOpen}", textAlign: TextAlign.center,),
            Text(GetPlatform.isAndroid ? "Ini Android" : "Ini Bukan Android", textAlign: TextAlign.center,),
            Text(GetPlatform.isIOS ? "Ini IOS" : "Ini Bukan IOS", textAlign: TextAlign.center,),
            Text("Height Get X : ${Get.height}", textAlign: TextAlign.center,),
            Text("Width Get X: ${Get.width}", textAlign: TextAlign.center,),
            Text("Height : ${MediaQuery.of(context).size.height}", textAlign: TextAlign.center,),
            Text("Width : ${MediaQuery.of(context).size.width}", textAlign: TextAlign.center,),
            Text("ORIENTASI  : ${context.orientation}", textAlign: TextAlign.center,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print("SNACKBAR STATUS OPEN : ${Get.isSnackbarOpen}");
          // Get.snackbar("Judul", "description");
          // print("SNACKBAR STATUS OPEN : ${Get.isSnackbarOpen}");
          // Get.removeRoute(Get.rawRoute!);
          
          Get.until((route) => Get.currentRoute == '/');
        },
      ),
    );
  }
}
