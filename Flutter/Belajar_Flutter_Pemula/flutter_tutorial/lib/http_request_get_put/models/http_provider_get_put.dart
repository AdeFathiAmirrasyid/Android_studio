import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProviderGetPut with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;
  late Uri apiURL;
  void connectAPI(String id, BuildContext context) async {
    apiURL = Uri.parse("https://reqres.in/api/users/$id");
    var hasilResponse = await http.get(apiURL);

    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))['data'];
      notifyListeners();
      handleStatusCode(context,"Berhasil");
    } else {
      // gagal mengambil data dari server
      handleStatusCode(context,"Gagal Get Data");
    }
  }

  void deleteData(BuildContext context) async {
    var hasilResponse = await http.delete(apiURL);
    if (hasilResponse.statusCode == 204) {
      _data = {};
      notifyListeners();
      handleStatusCode(context,"No content!");
    }
  }

  handleStatusCode(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 700),
    ));
  }
}
