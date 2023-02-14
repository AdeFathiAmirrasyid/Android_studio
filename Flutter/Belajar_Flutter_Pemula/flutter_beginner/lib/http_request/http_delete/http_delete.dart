import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Http Delete"),
          actions: [
            IconButton(
                onPressed: () async {
                  var response = await http
                      .get(Uri.parse("https://reqres.in/api/users/2"));
                  Map<String, dynamic> dataJson = jsonDecode(response.body);
                  data =
                      "Name : ${dataJson['data']['first_name']}  ${dataJson['data']['last_name']}";
                  setState(() {});
                },
                icon: const Icon(Icons.file_download_outlined))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(data),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    var response = await http
                        .delete(Uri.parse("https://reqres.in/api/users/2"));

                    setState(() {
                      if (response.statusCode == 204) {
                        data = "Berhasil dihapus";
                      }
                    });
                  },
                  child: Text("Delete"))
            ],
          ),
        ));
  }
}
