import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QueryController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void filter(int age) async {
    final resutls = await firestore
        .collection("users")
        .orderBy('name')
        .startAt(['Laudiya'])
        .get();
    // final resutls = await firestore.collection("users")
    //     .where("motor", arrayContainsAny: ["yamaha", "kawasaki"])
    //     .where("motor", whereIn: [
    //   ["yamaha", "kawasaki"],
    //   ["yamaha", "suzuki"]
    // ]).get();

    // final resutls = await firestore
    //     .collection("users")
    //     .orderBy('age')
    //     // .orderBy('name', descending: true)
    //     .limitToLast(2)
    //     .get();
    if (resutls.docs.length > 0) {
      print("Total data filter : ${resutls.docs.length}");
      resutls.docs.forEach((element) {
        var id = element.id;
        var data = element.data();

        print("ID : $id");
        print("Data : $data");
      });
    } else {
      print("Tidak ada data pada filter ini : ${resutls.docs.length}");
    }
  }
}
