import 'package:get/get.dart';

import '../controllers/animated_widget_controller.dart';

class AnimatedWidgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnimatedWidgetController>(
      () => AnimatedWidgetController(),
    );
  }
}
