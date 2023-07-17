import 'package:get/get.dart';

import '../controllers/adaptive_controller.dart';

class AdaptiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdaptiveController>(
      () => AdaptiveController(),
    );
  }
}
