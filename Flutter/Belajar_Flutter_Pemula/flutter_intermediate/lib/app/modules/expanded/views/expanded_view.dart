import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/expanded_controller.dart';

class ExpandedView extends GetView<ExpandedController> {
  double widthDevice = Get.width;
  double heightDevice = Get.height;
  @override
  Widget build(BuildContext context) {
    // double widthDevice = MediaQuery.of(context).size.width;
    // double heightDevice = MediaQuery.of(context).size.height;
    double paddingTop = context.mediaQueryPadding.top;
    double paddingBottom = context.mediaQueryPadding.bottom;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expanded'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  width: widthDevice * 0.15,
                  height: widthDevice * 0.15,
                  color: Colors.indigo,
                ),
                const Expanded(
                  child: ListTile(
                    tileColor: Colors.blueAccent,
                    leading: Icon(Icons.ice_skating),
                    title: Text("JUDUL"),
                  ),
                ),
                Container(
                  width: widthDevice * 0.15,
                  height: widthDevice * 0.15,
                  color: Colors.amber,
                )
              ],
            ),
            const Text("Fitted Box"),
            Container(
              width: 300,
              height: 100,
              color: Colors.amber,
              child: const FittedBox(
                  child: Text("Hallooasdfasfasoooooooooooooooooo")),
            ),
            const Text("Wrap"),
            Wrap(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  width: widthDevice * 0.15,
                  height: 20,
                  color: Colors.amber,
                ),
              ],
            ),
            const Text("Layout Builder"),
            Container(
              width: Get.width * 0.5,
              height: Get.height * 0.2,
              color: Colors.amber,
              child: LayoutBuilder(builder: (p0, p1) {
                double lebar = p1.maxWidth;
                double tinggi = p1.maxHeight;
                return Stack(
                  children: [
                    Container(
                      width: lebar * 0.5,
                      height: tinggi * 0.5,
                      color: Colors.indigo,
                    )
                  ],
                );
              }),
            ),
            const Text("Constrained Box"),
            ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 200, minHeight: 100,
                  maxWidth: 200,
                  minWidth: 100),
              child: Container(
                width: 30000,
                height: 200,
                color: Colors.amber,
                child: Text("Halllo"),
              ),
            )
          ],
        ));
  }
}
