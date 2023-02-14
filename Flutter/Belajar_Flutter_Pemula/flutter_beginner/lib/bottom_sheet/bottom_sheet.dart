import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Sheet"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isDismissible: false,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () => print("click photo"),
                        leading: const Icon(Icons.photo_sharp),
                        title: const Text("Photo"),
                      ),
                      ListTile(
                        onTap: () => print("click music"),
                        leading: const Icon(Icons.music_note),
                        title: const Text("Music"),
                      ),
                      ListTile(
                        onTap: () => print("click video"),
                        leading: const Icon(Icons.video_collection_sharp),
                        title: const Text("Video"),
                      ),
                      ListTile(
                        onTap: () => print("click share"),
                        leading: const Icon(Icons.share),
                        title: const Text("share"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: const Icon(Icons.cancel),
                        title: const Text("Cancel"),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Text("Bottom Sheet"),
        ),
      ),
    );
  }
}
