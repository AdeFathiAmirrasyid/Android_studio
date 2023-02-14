import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/platform_restautant_widget.dart';
import 'menu_restaurant_page.dart';

class HomePageRestaurant extends StatelessWidget {
  HomePageRestaurant({Key? key}) : super(key: key);
  final int _bottomNavIndex = 0;
  static const routeName = '/home-page';

  @override
  Widget build(BuildContext context) {
    return PlatformRestaurantWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOS,
    );
  }

  final List<Widget> _listWidget = [
    const MenuRestaurantPage()
  ];

  Widget _buildAndroid(BuildContext context){
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
    );
  }


  Widget _buildIOS(BuildContext context){
    return CupertinoTabScaffold(tabBar:CupertinoTabBar(
      items: const [],
    ), tabBuilder: (context, index) {
      return Column(
        children: const [
          Text("IOS")
        ],
      );
    },);
  }
}
