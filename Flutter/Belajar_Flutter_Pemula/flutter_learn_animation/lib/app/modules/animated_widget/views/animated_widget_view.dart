import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/animated_widget_controller.dart';

class AnimatedWidgetView extends GetView<AnimatedWidgetController> {
  const AnimatedWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxRound(controller.animationController),
            SizedBox(height: 50),
            BoxRound(controller.animationController),
            SizedBox(height: 50),
            BoxRound(controller.animationController),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class BoxRound extends AnimatedWidget {
  final animation;
  BoxRound(this.animation) : super(listenable: animation);

  get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: progress.value * pi * 0.25,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
    );
  }
}
