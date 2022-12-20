import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fade_transition_controller.dart';

class FadeTransitionView extends GetView<FadeTransitionController> {
  const FadeTransitionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FadeTransitionView'),
        centerTitle: true,
      ),
      body: Center(
          child: FadeTransition(
        opacity: controller.animation,
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red[900],
        ),
      )),
    );
  }
}
