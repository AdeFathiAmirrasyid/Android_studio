import 'package:app/get_x/route_management_getx/pages/home_page_satu.dart';
import 'package:app/get_x/route_management_getx/pages/pages_1.dart';
import 'package:app/get_x/route_management_getx/pages/pages_2.dart';
import 'package:app/get_x/route_management_getx/pages/pages_3.dart';
import 'package:app/get_x/route_management_getx/pages/pages_4.dart';
import 'package:app/get_x/route_management_getx/pages/pages_5.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePageSatuRoute(),
      getPages: [
        GetPage(name: '/home', page: () => const HomePageSatuRoute()),
        GetPage(name: '/page_satu', page: () => const Pages_1()),
        GetPage(name: '/page_dua', page: () => Pages_2()),
        GetPage(name: '/page_tiga', page: () => Pages_3()),
        GetPage(name: '/page_empat', page: () => Pages_4()),
        GetPage(name: '/page_lima', page: () => Pages_5()),
      ],
    );
  }
}
