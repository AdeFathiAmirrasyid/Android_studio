import 'package:flutter_tutorial/getx/get_storage/routes/route_name_storage.dart';
import 'package:get/get.dart';

import '../pages/home_storage.dart';
import '../pages/login_storage.dart';

class AppRouteStorage {
  static final pages = [
    GetPage(name: RouteNameStorage.home, page: () => HomeStorage()),
    GetPage(name: RouteNameStorage.login, page: () => LoginStorage())
  ];
}
