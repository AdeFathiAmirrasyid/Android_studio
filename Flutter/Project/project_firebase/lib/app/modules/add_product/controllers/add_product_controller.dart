import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController priceController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String name, String price) async {
    CollectionReference products = firestore.collection("products");
    try {
      String dateNow = DateTime.now().toIso8601String();
      await products.add({"name": name, "price": int.parse(price), "date": dateNow});
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menambahkan product",
          onConfirm: () {
            nameController.clear();
            priceController.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "Okey");
    } catch (error) {
      print(error);
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak berhasil menambahkan product");
    }
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    priceController.dispose();
    super.onClose();
  }
}
