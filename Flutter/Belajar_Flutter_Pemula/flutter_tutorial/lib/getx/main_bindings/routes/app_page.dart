import 'package:get/get.dart';

import '../bindings/count_binding.dart';
import '../pages/count_binding.dart';
import '../pages/home_count.dart';
import '../routes/route_name.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.home, page: () => const BindingsPageHome()),
    GetPage(
        name: RouteName.count,
        page: () => PageCountBindings(),
        binding: CountBinding()),
  ];
}
