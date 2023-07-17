import 'package:get/get.dart';
import 'package:latihan_getconnect/app/data/providers/user_provider.dart';

import '../../../data/models/user_model.dart';

class HomeController extends GetxController {
  UserProvider userProvider = UserProvider();


  Future<List<User>?> getAllUsers() async{
    return userProvider.getAllUsers();
  }
}
