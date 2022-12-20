import 'package:get/get.dart';
class BindingController extends GetxController{
  var count = 0.obs;
  add() => count++;
}