import 'package:get/get.dart';

import '../controllers/box_transition_controller.dart';

class BoxTransitionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoxTransitionController>(
      () => BoxTransitionController(),
    );
  }
}
