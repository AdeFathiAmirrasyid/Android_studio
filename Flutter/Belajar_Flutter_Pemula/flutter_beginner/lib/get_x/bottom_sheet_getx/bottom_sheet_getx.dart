import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
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
        title: const Text("BottomSheet Get X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => SizedBox(
                    height: 200,
                    child: Column(
                      children: const [
                        ListTile(
                          leading: Icon(Icons.home),
                          title: Text("Home"),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text("Setting"),
                        ),
                        ListTile(
                          leading: Icon(Icons.search),
                          title: Text("Search"),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: const Text("BottomSheet"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      height: 200,
                      child: ListView(
                        children: const [
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text("Home"),
                          ),
                          ListTile(
                            leading: Icon(Icons.settings),
                            title: Text("Setting"),
                          ),
                          ListTile(
                            leading: Icon(Icons.search),
                            title: Text("Search"),
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("BottomSheet Get X")),

          ],
        ),
      ),
    );
  }
}
