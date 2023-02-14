import 'package:fundamental_flutter/restaurant_app/model/restaurant.dart';

class RestaurantDetail {
  List<Restaurant> restaurant;

  RestaurantDetail({required this.restaurant});
  factory RestaurantDetail.fromJson(Map<String, dynamic> restaurant) {
    return RestaurantDetail(
        restaurant: List<Restaurant>.from(restaurant['restaurants']
            .map((json) => Restaurant.fromJson(json))));
  }

  // Map<String, dynamic> parseJson() => {
  //       "restaurants":
  //           List<dynamic>.from(restaurant.map((json) => json.parseJson()))
  //     };
}
