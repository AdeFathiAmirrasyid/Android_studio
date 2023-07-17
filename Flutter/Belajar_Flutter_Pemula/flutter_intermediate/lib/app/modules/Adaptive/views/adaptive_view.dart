import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/adaptive_controller.dart';

class AdaptiveView extends GetView<AdaptiveController> {
  const AdaptiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('AdaptiveView'),
                centerTitle: true,
              ),
              body: (GetPlatform.isAndroid) ? Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.greenAccent,
                  )) : Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.black,
                  )));
        }else{
          return Scaffold(
              appBar: AppBar(
                title: const Text('AdaptiveView'),
                centerTitle: true,
              ),
              body: Center(
                  child: Container(
                    width: 400,
                    height: 200,
                    color: Colors.amber,
                  )));
        }
      },
    );
  }
}
