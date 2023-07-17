import 'package:get/get.dart';

import '../controllers/sliver_persistent_header_controller.dart';

class SliverPersistentHeaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SliverPersistentHeaderController>(
      () => SliverPersistentHeaderController(),
    );
  }
}
