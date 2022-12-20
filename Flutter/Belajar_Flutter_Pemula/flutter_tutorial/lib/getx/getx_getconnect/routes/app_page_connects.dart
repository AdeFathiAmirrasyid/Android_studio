import 'package:flutter_tutorial/getx/getx_getconnect/routes/route_name_connect.dart';
import 'package:get/get.dart';

import '../bindings/add_user_binding.dart';
import '../bindings/profile_binding.dart';
import '../pages/add_page_connect.dart';
import '../pages/home_page_connect.dart';
import '../pages/profile_page_connect.dart';

class AppPageConnects {
  static final pages = [
    GetPage(name: RouteNameConnect.home, page: () => HomePageConnect()),
    GetPage(name: RouteNameConnect.add, page: () => AddPageConnect(), binding: AddUserBinding()),
    GetPage(name: RouteNameConnect.profile, page: () => ProfilePageConnect(), binding: ProfileBinding() )
  ];
}
