import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateFullGetPut {
  String id, fullName, email, avatar;

  HttpStateFullGetPut(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.avatar});

  static Future<HttpStateFullGetPut> connectAPI(String id) async {
    Uri apiURL = Uri.parse("https://reqres.in/api/users/$id");
    var hasilResponse = await http.get(apiURL);

    var data = (json.decode(hasilResponse.body))['data'];

    return HttpStateFullGetPut(
        id:  data['id'].toString(),
        fullName: data['first_name'] + " " + data['last_name'],
        email: data['email'],
        avatar: data['avatar']);
  }
}
