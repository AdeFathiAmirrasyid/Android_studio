import 'package:get/get.dart';

import '../services/user_service_statemixin.dart';

class MyControllerStsteMixin extends GetxController
    with StateMixin<Map<String, dynamic>> {
  void getData() {
    try {
      UserServiceStateMixin().getUser().then((response) {
        if (response.statusCode == 200) {
          final data = response.body["data"] as Map<String, dynamic>;
          change(data, status: RxStatus.success());
        }
      }, onError: (_) {
        change(null, status: RxStatus.error("Tidak dapat data dari api"));
      });
    } catch (err) {
      change(null, status: RxStatus.error(err.toString()));
    }
  }

  @override
  void onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }
}
