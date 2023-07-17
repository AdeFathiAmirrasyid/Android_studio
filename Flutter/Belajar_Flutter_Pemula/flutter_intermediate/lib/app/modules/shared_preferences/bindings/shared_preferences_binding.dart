import 'package:get/get.dart';

import '../controllers/shared_preferences_controller.dart';

class SharedPreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SharedPreferencesController>(
      () => SharedPreferencesController(),
    );
  }
}
