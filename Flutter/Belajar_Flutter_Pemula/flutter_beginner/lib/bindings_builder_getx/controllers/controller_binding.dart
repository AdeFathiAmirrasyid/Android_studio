import 'package:get/get.dart';

class ControllerBindings extends GetxController {
  var counter = 0.obs;
  increment() => counter++;
  decrement() => counter--;
}
