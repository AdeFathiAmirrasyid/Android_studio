import 'package:get/get.dart';

import '../controllers/mycontroller.dart';

class StateBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(MyControllerStsteMixin());
  }

}