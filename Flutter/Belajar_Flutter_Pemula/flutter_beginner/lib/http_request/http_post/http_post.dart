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
  TextEditingController nameController = TextEditingController();

  TextEditingController jobController = TextEditingController();

  String data = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: jobController,
              autocorrect: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: "Job"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () async {
                  var resultResponse = await http
                      .post(Uri.parse("https://reqres.in/api/users"), body: {
                    'name': nameController.text,
                    'job': jobController.text
                  });
                  setState(() {
                    var mydata = json.decode(resultResponse.body);
                    data = "Name : ${mydata['name']} - Job : ${mydata['job']}";
                  });
                },
                child: const Text("Submit")),
            const SizedBox(height: 50),
            const Divider(color: Colors.blue),
            const SizedBox(height: 10),
            Text(data),
          ],
        ),
      ),
    );
  }
}
