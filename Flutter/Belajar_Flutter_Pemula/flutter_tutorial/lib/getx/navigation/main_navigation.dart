import 'package:flutter/material.dart';
import 'package:flutter_tutorial/getx/navigation/pages/page_navigation.dart';
import 'package:flutter_tutorial/getx/navigation/routes/page_route.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MainNavigationApp());
}

class MainNavigationApp extends StatelessWidget {
  const MainNavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: const PageNavigation(),
      // unknownRoute: GetPage(name: '/404', page: () => PageNotFound()),
      // initialRoute: '/',
      getPages:PageRouteNavigator.pages,
    );
  }
}
