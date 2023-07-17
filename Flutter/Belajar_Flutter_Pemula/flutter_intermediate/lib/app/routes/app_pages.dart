import 'package:get/get.dart';

import '../modules/Adaptive/bindings/adaptive_binding.dart';
import '../modules/Adaptive/views/adaptive_view.dart';
import '../modules/AllAnimation/bindings/all_animation_binding.dart';
import '../modules/AllAnimation/views/all_animation_view.dart';
import '../modules/carausel_fullscreen/bindings/carausel_fullscreen_binding.dart';
import '../modules/carausel_fullscreen/views/carausel_fullscreen_view.dart';
import '../modules/carousel_slider/bindings/carousel_slider_binding.dart';
import '../modules/carousel_slider/views/carousel_slider_view.dart';
import '../modules/expanded/bindings/expanded_binding.dart';
import '../modules/expanded/views/expanded_view.dart';
import '../modules/flexible/bindings/flexible_binding.dart';
import '../modules/flexible/views/flexible_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_shared_preferences/bindings/login_shared_preferences_binding.dart';
import '../modules/login_shared_preferences/views/login_shared_preferences_view.dart';
import '../modules/media_query/bindings/media_query_binding.dart';
import '../modules/media_query/views/media_query_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/shared_preferences/bindings/shared_preferences_binding.dart';
import '../modules/shared_preferences/views/shared_preferences_view.dart';
import '../modules/sliver_appBar/bindings/sliver_app_bar_binding.dart';
import '../modules/sliver_appBar/views/sliver_app_bar_view.dart';
import '../modules/sliver_persistent_header/bindings/sliver_persistent_header_binding.dart';
import '../modules/sliver_persistent_header/views/sliver_persistent_header_view.dart';

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
      name: _Paths.MEDIA_QUERY,
      page: () => const MediaQueryView(),
      binding: MediaQueryBinding(),
    ),
    GetPage(
      name: _Paths.FLEXIBLE,
      page: () => const FlexibleView(),
      binding: FlexibleBinding(),
    ),
    GetPage(
      name: _Paths.EXPANDED,
      page: () => ExpandedView(),
      binding: ExpandedBinding(),
    ),
    GetPage(
      name: _Paths.ADAPTIVE,
      page: () => const AdaptiveView(),
      binding: AdaptiveBinding(),
    ),
    GetPage(
      name: _Paths.ALL_ANIMATION,
      page: () => AllAnimationView(),
      binding: AllAnimationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CAROUSEL_SLIDER,
      page: () => CarouselSliderView(),
      binding: CarouselSliderBinding(),
    ),
    GetPage(
      name: _Paths.CARAUSEL_FULLSCREEN,
      page: () => const CarauselFullscreenView(),
      binding: CarauselFullscreenBinding(),
    ),
    GetPage(
      name: _Paths.SLIVER_APP_BAR,
      page: () => const SliverAppBarView(),
      binding: SliverAppBarBinding(),
    ),
    GetPage(
      name: _Paths.SLIVER_PERSISTENT_HEADER,
      page: () => const SliverPersistentHeaderView(),
      binding: SliverPersistentHeaderBinding(),
    ),
    GetPage(
      name: _Paths.SHARED_PREFERENCES,
      page: () => const SharedPreferencesView(),
      binding: SharedPreferencesBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SHARED_PREFERENCES,
      page: () => const LoginSharedPreferencesView(),
      binding: LoginSharedPreferencesBinding(),
    ),
  ];
}
