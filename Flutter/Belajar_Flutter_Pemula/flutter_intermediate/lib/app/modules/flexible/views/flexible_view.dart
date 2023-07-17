import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flexible_controller.dart';

class FlexibleView extends GetView<FlexibleController> {
  const FlexibleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = MediaQuery.of(context).padding.top;
    double paddingBottom = MediaQuery.of(context).padding.bottom;

    AppBar appBar() {
      return AppBar();
    }

    double heightBody =
        heightDevice - appBar().preferredSize.height - paddingTop;
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.blueAccent,
              width: widthDevice * 0.5,
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.amber,
              width: widthDevice * 0.5,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              color: Colors.indigo,
              width: widthDevice * 0.5,
            ),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Container(
      //         color: Colors.blueAccent,
      //         width: widthDevice * 0.5,
      //         height: heightBody * 0.5),
      //     Container(
      //         color: Colors.amber,
      //         width: widthDevice * 0.5,
      //         height: heightBody * 0.3),
      //     Container(
      //         color: Colors.indigo,
      //         width: widthDevice * 0.5,
      //         height: heightBody * 0.2),
      //   ],
      // ),
    );
  }
}
