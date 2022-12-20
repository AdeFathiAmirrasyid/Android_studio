import 'dart:convert';

import 'package:get/get.dart';

class UserService extends GetConnect {
  final url =
      "https://getconnect-project-171cb-default-rtdb.asia-southeast1.firebasedatabase.app/";

  // Get Request
  Future<Response> getUser(int id) => get('');

  // Post Save Data ke Database
  Future<Response> postData(String name, String email, String phone) {
    final body = json.encode({"name": name, "email": email, "phone": phone});
    return post("${url}users.json", body);
  }

  // Delete user dari database
  Future<Response> deleteData(String id) {
    return delete("${url}users/$id.json");
  }

  // Post Edit Data ke Database
  Future<Response> editData(
      String id, String name, String email, String phone) {
    final body = json.encode({"name": name, "email": email, "phone": phone});
    return patch("${url}users/$id.json", body);
  }
}
