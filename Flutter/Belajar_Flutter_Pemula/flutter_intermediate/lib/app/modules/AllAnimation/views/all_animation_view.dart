import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/all_animation_controller.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AllAnimationView extends GetView<AllAnimationController> {
  AllAnimationView({Key? key}) : super(key: key);

  DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
        borderRadius: BorderRadius.circular(100), color: Colors.amber),
    end: const BoxDecoration(color: Colors.red),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllAnimationView'),
        centerTitle: true,
      ),
      body: ListView(children: [
        const SizedBox(height: 30),
        const Center(child: Text("Animated Container")),
        GestureDetector(
          onTap: () => controller.selected.toggle(),
          child: Obx(
            () => Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.ease,
                width: controller.selected.isFalse ? 200 : 300,
                height: controller.selected.isFalse ? 200 : 100,
                color: controller.selected.isFalse
                    ? Colors.amber
                    : Colors.greenAccent,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Animated Align")),
        GestureDetector(
          onTap: () => controller.selected1.toggle(),
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.greenAccent,
              child: Obx(
                () => AnimatedAlign(
                    duration: const Duration(seconds: 2),
                    alignment: controller.selected1.isFalse
                        ? Alignment.center
                        : Alignment.topLeft,
                    child: const Text("fathi insani")),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Animated Crossfade")),
        GestureDetector(
          onTap: () => controller.crossfade.toggle(),
          child: Center(
            child: Obx(
              () => AnimatedCrossFade(
                duration: const Duration(seconds: 2),
                firstChild: Container(
                  width: 200,
                  height: 200,
                  color: Colors.lightBlueAccent,
                ),
                secondChild: const FlutterLogo(
                  size: 200,
                ),
                crossFadeState: controller.crossfade.isFalse
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Animated Opacity")),
        GestureDetector(
          onTap: () => controller.opacity.toggle(),
          child: Center(
            child: Obx(
              () => AnimatedOpacity(
                duration: const Duration(seconds: 2),
                opacity: controller.opacity.isFalse ? 1 : 0,
                child: const FlutterLogo(
                  size: 200,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Animated Positioned")),
        GestureDetector(
          onTap: () => controller.positioned.toggle(),
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.lightBlueAccent,
              child: Stack(
                children: [
                  Obx(
                    () => AnimatedPositioned(
                      duration: const Duration(seconds: 2),
                      top: 10,
                      left: controller.positioned.isFalse ? 0 : 100,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Animated Builder")),
        Center(
          child: Container(
            width: 300,
            height: 200,
            color: Colors.greenAccent,
            child: Stack(
              children: [
                AnimatedBuilder(
                  animation: controller.animatedController,
                  builder: (context, childWidget) {
                    return Positioned(
                        top: 0,
                        right: 2 *
                            (0.5 -
                                (0.5 - controller.animatedController.value)
                                    .abs()) *
                            250,
                        child: childWidget!);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Animated Widget")),
        Center(
          child: MyWidget(myC: controller.animatedController),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Decorated Box Transition")),
        Center(
          child: DecoratedBoxTransition(
            decoration: decorationTween.animate(controller.animatedController),
            child: Container(
              width: 200,
              height: 200,
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Fade Transition")),
        Center(
          child: FadeTransition(
            opacity: CurvedAnimation(
                parent: controller.animatedController, curve: Curves.easeIn),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.lightBlue,
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Avatar Glow")),
        Center(
          child: AvatarGlow(
            glowColor: Colors.black,
            endRadius: 150,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Lottie")),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 150,
                height: 150,
                child: Lottie.network(
                    "https://assets4.lottiefiles.com/packages/lf20_3vbOcw.json"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                width: 150,
                height: 150,
                child: Lottie.asset("assets/lottie/hello.json"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Hero")),
        Center(
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.PROFILE),
            child: Hero(
              tag: "tag1",
              child: ClipOval(
                  child: Image.network(
                "https://picsum.photos/id/738/100/100",
                fit: BoxFit.cover,
              )),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Center(child: Text("Backdrop Filter")),
        Center(
          child: Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.grey[300],
                child: const FlutterLogo(
                  size: 200,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 1, sigmaX: 1),
                child: Container(),
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
      ]),
    );
  }
}

class MyWidget extends AnimatedWidget {
  MyWidget({
    required this.myC,
    Key? key,
  }) : super(key: key, listenable: myC);
  AnimationController myC;

  get progress => listenable;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: progress.value * 2 * pi,
      child: Container(
        width: 200,
        height: 200,
        color: Colors.indigo,
      ),
    );
  }
}
