import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products
        .orderBy("date", descending: true)
        .snapshots();
  }

  void deleteProduct(String? docId) {
    DocumentReference documentReference =
        firestore.collection("products").doc(docId);

    try {
      Get.defaultDialog(
          title: "Delete Data",
          middleText: "Apakah kamu yakin akan menghapus data ini ?",
          onConfirm: () async {
            await documentReference.delete();
            Get.back();
          },
          textConfirm: "YES",
          textCancel: "NO");
    } catch (error) {
      print(error);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil menghapus data ini",
      );
    }
  }
}
