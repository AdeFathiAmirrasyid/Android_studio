import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void subscribe() async {
    print("Dijalankan");
    await FirebaseMessaging.instance.subscribeToTopic('AdeFathi');
  }
}
