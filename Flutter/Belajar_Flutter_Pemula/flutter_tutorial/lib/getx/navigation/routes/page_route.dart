import 'package:flutter_tutorial/getx/navigation/routes/route_name.dart';
import 'package:get/get.dart';

import '../pages/page_dua_navigation.dart';
import '../pages/page_navigation.dart';
import '../pages/page_tiga_navigation.dart';

class PageRouteNavigator {
  static final pages = [
    GetPage(name: RouteName.page_1, page: () => const PageNavigation()),
    GetPage(name: RouteName.page_2, page: () => const PageDuaNavigation()),
    GetPage(name: RouteName.page_3, page: () => const PageTigaNavigation()),
  ];
}
