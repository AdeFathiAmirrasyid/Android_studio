import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateFull {
  String id, name, job, createdAt;

  HttpStateFull(
      {this.id = '', this.name = '', this.job = '', this.createdAt = ''});

  static Future<HttpStateFull> connectAPI(String name, String job) async {
    Uri apiURL = Uri.parse("https://reqres.in/api/users");
    var hasilResponse =
        await http.post(apiURL, body: {"name": name, "job": job});

    var data = json.decode(hasilResponse.body);
    return HttpStateFull(
        id: data['id'],
        name: data['name'],
        job: data['job'],
        createdAt: data['createdAt']);
  }
}
