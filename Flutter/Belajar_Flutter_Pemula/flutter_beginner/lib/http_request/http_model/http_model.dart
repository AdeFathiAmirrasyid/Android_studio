import 'dart:convert';

import 'package:app/http_request/http_model/model/user_model.dart';
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
  List<UserModel> allData = [];

  Future<void> getData() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List dataResponse =
          (json.decode(response.body) as Map<String, dynamic>)['data'];
      for (var element in dataResponse) {
        allData.add(UserModel.fromJson(element));
      }
    } catch (error) {
      print("terjadi kesalahan");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Model"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(allData[index].avatar),
                  ),
                  title: Text("${allData[index].firstName} ${allData[index].lastName}"),
                  subtitle: Text(allData[index].email),
                );
              },
            );
          }),
    );
  }
}
