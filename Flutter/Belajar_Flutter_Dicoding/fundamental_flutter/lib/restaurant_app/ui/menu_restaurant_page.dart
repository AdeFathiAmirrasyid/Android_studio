import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundamental_flutter/restaurant_app/model/restaurant.dart';
import 'package:fundamental_flutter/restaurant_app/model/restaurant_detail.dart';

import '../widgets/platform_restautant_widget.dart';
import 'card_restaurant.dart';

class MenuRestaurantPage extends StatelessWidget {
  const MenuRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformRestaurantWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIOS,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                title: const Text("Menu Restaurant"),
                backgroundColor: Colors.black54,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/image/image_rest.jpg',
                        fit: BoxFit.cover,
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.0, 0.9),
                            end: Alignment.topRight,
                            colors: <Color>[
                              Color(0x60000000),
                              Color(0x00000000),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: _buildListMenu(context)),
    );
  }

  Widget _buildListMenu(BuildContext context) {
    return FutureBuilder<String>(
        future:
            DefaultAssetBundle.of(context).loadString('assets/restaurant.json'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final RestaurantDetail restaurantDetail =
                RestaurantDetail.fromJson(json.decode(snapshot.data));
            return ListView.builder(
                itemCount: restaurantDetail.restaurant.length,
                itemBuilder: (context, index) =>
                    _buildMenuRestaurantItem(context, restaurantDetail));
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildMenuRestaurantItem(
      BuildContext context, RestaurantDetail restaurantDetail) {
    return Column(
        children: restaurantDetail.restaurant
            .map(
              (item) => CardRestaurant(
                restaurant: item,
              ),
            )
            .toList());
  }

  Widget _buildIOS(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("res"),
      ),
    );
  }
}

