import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Http Request")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ID : $id"),
            Text("Email : $email"),
            Text("Name : $name"),
            ElevatedButton(
              onPressed: () async {
                var response =
                    await http.get(Uri.parse("https://reqres.in/api/users/5"));
                if (response.statusCode == 200) {
                  // berhasil get data
                  var data = json.decode(response.body);
                  setState(() {
                    id = "${data['data']['id']}";
                    email = "${data['data']['email']}";
                    name =
                        "${data['data']['first_name']} ${data['data']['last_name']}";
                  });
                } else {
                  // tidak berhasil get data
                  setState(() {
                    // body = "ERROR ${response.statusCode}";
                  });
                }
              },
              child: const Text("Get Http Request"),
            ),
          ],
        ),
      ),
    );
  }
}
