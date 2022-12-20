import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BoxTransitionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController animationController;

  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x66666666),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 6),
            )
          ]),
      end: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.zero));

  @override
  void onInit() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
