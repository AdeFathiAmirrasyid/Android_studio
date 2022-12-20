import 'package:get/get.dart';

class CounterControllerDasarGetX extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
  }
}
