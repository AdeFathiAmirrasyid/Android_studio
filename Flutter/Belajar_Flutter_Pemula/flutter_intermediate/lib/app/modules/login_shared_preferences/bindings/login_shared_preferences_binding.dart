import 'package:get/get.dart';

import '../controllers/login_shared_preferences_controller.dart';

class LoginSharedPreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginSharedPreferencesController>(
      () => LoginSharedPreferencesController(),
    );
  }
}
