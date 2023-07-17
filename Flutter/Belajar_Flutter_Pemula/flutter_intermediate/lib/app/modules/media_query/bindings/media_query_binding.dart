import 'package:get/get.dart';

import '../controllers/media_query_controller.dart';

class MediaQueryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaQueryController>(
      () => MediaQueryController(),
    );
  }
}
