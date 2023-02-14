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

class HomePage extends StatelessWidget {
  List allData = [];
  Future<void> getData() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List data =
          ((json.decode(response.body)) as Map<String, dynamic>)['data'];
      for (var element in data) {
        allData.add(element);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Future Builder"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: allData.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage("${allData[index]['avatar']}"),
              ),
              title: Text(
                  "${allData[index]['first_name']} ${allData[index]['last_name']}"),
              subtitle: Text(
                  "${allData[index]['email']}"),
            ),
          );
        },
      ),
    );
  }
}
