import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  RxInt textData = 0.obs;

  increment() {
    textData++;
    saveData();
  }

  decrement() {
    textData--;
    saveData();
  }

  saveData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt("endNumber") != null) {
      await prefs.remove('endNumber');
    }
    await prefs.setInt('endNumber', textData.value);
  }

  readData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('endNumber') != null) {
      textData.value = prefs.getInt('endNumber')!;
    }
  }

  @override
  void onInit() {
    readData();
    super.onInit();
  }

  removeData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('endNumber') != null) {
      await prefs.remove('endNumber');
      textData.value = 0;
    }
  }
}
