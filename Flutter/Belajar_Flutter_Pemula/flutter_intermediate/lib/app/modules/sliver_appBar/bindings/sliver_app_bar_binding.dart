import 'package:get/get.dart';

import '../controllers/sliver_app_bar_controller.dart';

class SliverAppBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverAppBarController>(
      () => SliverAppBarController(),
    );
  }
}
