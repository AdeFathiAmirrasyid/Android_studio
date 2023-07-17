import 'package:get/get.dart';

import '../controllers/carausel_fullscreen_controller.dart';

class CarauselFullscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarauselFullscreenController>(
      () => CarauselFullscreenController(),
    );
  }
}
