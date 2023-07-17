import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AllAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool selected = false.obs;
  RxBool selected1 = false.obs;
  RxBool crossfade = false.obs;
  RxBool opacity = false.obs;
  RxBool positioned = false.obs;

  late AnimationController animatedController =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true);
}
