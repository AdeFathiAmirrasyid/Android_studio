import 'package:flutter_tutorial/getx/dynamic_url/pages/detail_page_dynamic_url.dart';
import 'package:flutter_tutorial/getx/dynamic_url/routes/routes_name.dart';
import 'package:get/get.dart';

import '../pages/home_page_dynamic_url.dart';
import '../pages/product_page_dynamic_url.dart';

class DynamicRoute{
  static final pages = [
    GetPage(name: RouteNameDynamic.home, page: () =>  const HomePageDynamicUrl()),
    GetPage(name: RouteNameDynamic.product, page: () =>  const ProductPageDynamicUrl()),
    GetPage(name: RouteNameDynamic.product + '/:id?', page: () =>  const DetailPageDynamicUrl()),
  ];
}