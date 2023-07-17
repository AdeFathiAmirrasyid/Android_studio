import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class CarouselSliderController extends GetxController {
  RxInt index = 0.obs;
  CarouselController carouselController = CarouselController();
}
