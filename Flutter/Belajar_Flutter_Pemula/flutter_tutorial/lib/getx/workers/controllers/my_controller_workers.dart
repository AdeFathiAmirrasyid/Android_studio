import 'package:get/get.dart';

class MyControllerWorkers extends GetxController {
  var count = 0.obs;
  var data = 0.obs;
  void change() => count++;
  void reset() => count.value = 0;
//  Workers
  @override
  void onInit() {
    print("onInit");

    // memantau perubahanan state
    // ever(count, (_) => print("jalankan sesuatu...."));

    // memantau perubahanan pada state listener
    // everAll([count, data], (_) => print("jalankan sesuatu...."));

    // memantau perubahanan pada state hanya menjalanjakan sekali
    // once(count, (_) => print("jalankan sesuatu...."));

    // memantau perubahanan pada state hanya menjalanjakan setelah 3 detik
    // debounce(count, (_) => print("jalankan sesuatu...."),time: Duration(seconds: 3));

    // memantau perubahanan pada state setiap 3 detik
    interval(count, (_) => print("jalankan sesuatu...."),time: Duration(seconds: 3));
    super.onInit();
  }
}
