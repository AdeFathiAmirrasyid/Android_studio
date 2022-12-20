import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class FadeTransitionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation<double> animation;

  @override
  void onInit() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..repeat(reverse: true);

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeIn);
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
