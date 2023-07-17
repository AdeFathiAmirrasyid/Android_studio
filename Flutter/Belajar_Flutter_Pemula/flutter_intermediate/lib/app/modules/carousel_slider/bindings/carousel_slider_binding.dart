import 'package:get/get.dart';

import '../controllers/carousel_slider_controller.dart';

class CarouselSliderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarouselSliderController>(
      () => CarouselSliderController(),
    );
  }
}
