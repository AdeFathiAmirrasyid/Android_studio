import 'package:get/get.dart';

import '../models/user_model.dart';

class UserProvider extends GetConnect {
  Future<User?> getUser(int id) async {
    final response = await get('user/$id');
    return response.body;
  }

  Future<List<User>?> getAllUsers() async{
    final response = await get("https://reqres.in/api/users");
    return User.fromListJson(response.body['data']);
  }
}
