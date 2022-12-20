import 'package:get/get.dart';

class UserServiceStateMixin extends GetConnect {
  Future<Response> getUser() => get('https://reqres.in/api/users/2');
}
