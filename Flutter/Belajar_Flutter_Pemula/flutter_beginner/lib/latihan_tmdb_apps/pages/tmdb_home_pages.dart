import 'dart:convert';

import 'package:app/latihan_tmdb_apps/models/tmdb.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TmdbHomePage extends StatelessWidget {
  List<Tmdb> listData = [];

  Future<void> getAll() async {
    try {
      final response = await http.get(Uri.parse(
          "https://al-quran-8d642.firebaseio.com/data.json?print=pretty"));
      List data = json.decode(response.body);
      for (var element in data) {
        listData.add(Tmdb.fromJson(element));
      }
    } catch (error) {
      print("Terjadi Kesalahan");
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TMDB The Movie DB"),
      ),
      body: FutureBuilder(
        future: getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listData[index].nama),
                subtitle: Text(listData[index].arti),
              );
            },
          );
        },
      ),
    );
  }
}
