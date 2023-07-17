import 'package:get/get.dart';

import '../controllers/expanded_controller.dart';

class ExpandedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpandedController>(
      () => ExpandedController(),
    );
  }
}
