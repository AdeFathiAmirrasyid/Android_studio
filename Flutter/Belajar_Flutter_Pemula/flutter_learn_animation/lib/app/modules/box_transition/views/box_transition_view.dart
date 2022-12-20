import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/box_transition_controller.dart';

class BoxTransitionView extends GetView<BoxTransitionController> {
  const BoxTransitionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BoxTransitionView'),
        centerTitle: true,
      ),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: controller.decorationTween.animate(controller.animationController),
          child: Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(50),
            child: const FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
