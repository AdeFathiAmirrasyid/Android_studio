import 'package:get/get.dart';

import '../controllers/all_animation_controller.dart';

class AllAnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllAnimationController>(
      () => AllAnimationController(),
    );
  }
}
