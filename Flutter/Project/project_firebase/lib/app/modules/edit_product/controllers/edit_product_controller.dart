import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController priceController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = await firestore.collection('products').doc(docID);
    return docRef.get();
  }

  void editProduct(String name, String price, String docID) async {
    DocumentReference documentReference = firestore.collection('products').doc(docID);
    try {
      await documentReference.update({"name": name, "price": int.parse(price)});

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil mengubah data product",
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
          middleText: "Tidak berhasil mengubah data product");
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
