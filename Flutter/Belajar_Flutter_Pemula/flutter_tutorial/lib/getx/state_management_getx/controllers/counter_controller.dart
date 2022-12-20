import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  var isDark = false.obs;

  changeTheme() => isDark.value = !isDark.value;
  increment() => counter + 1;
}
