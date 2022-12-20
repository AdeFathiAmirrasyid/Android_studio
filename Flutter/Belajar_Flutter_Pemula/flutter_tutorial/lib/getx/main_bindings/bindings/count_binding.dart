import 'package:get/get.dart';

import '../controllers/binding_countroller.dart';

class CountBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BindingController());
  }

}