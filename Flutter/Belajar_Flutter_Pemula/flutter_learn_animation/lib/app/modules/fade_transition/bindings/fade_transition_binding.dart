import 'package:get/get.dart';

import '../controllers/fade_transition_controller.dart';

class FadeTransitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FadeTransitionController>(
      () => FadeTransitionController(),
    );
  }
}
