import 'package:get/get.dart';

import '../modules/animated_widget/bindings/animated_widget_binding.dart';
import '../modules/animated_widget/views/animated_widget_view.dart';
import '../modules/box_transition/bindings/box_transition_binding.dart';
import '../modules/box_transition/views/box_transition_view.dart';
import '../modules/fade_transition/bindings/fade_transition_binding.dart';
import '../modules/fade_transition/views/fade_transition_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ANIMATED_WIDGET,
      page: () => const AnimatedWidgetView(),
      binding: AnimatedWidgetBinding(),
    ),
    GetPage(
      name: _Paths.BOX_TRANSITION,
      page: () => const BoxTransitionView(),
      binding: BoxTransitionBinding(),
    ),
    GetPage(
      name: _Paths.FADE_TRANSITION,
      page: () => const FadeTransitionView(),
      binding: FadeTransitionBinding(),
    ),
  ];
}
