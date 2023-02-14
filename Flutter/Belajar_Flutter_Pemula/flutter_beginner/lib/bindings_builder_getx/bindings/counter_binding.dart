import 'package:get/get.dart';

import '../controllers/controller_binding.dart';

class CounterBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ControllerBindings());
  }

}