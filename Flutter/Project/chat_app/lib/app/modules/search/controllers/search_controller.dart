import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  late TextEditingController searchController;

  var queryAwal = [].obs;
  var tempSearch = [].obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void searchFriend(String data, String email) async {
    if (data.isEmpty) {
      queryAwal.value = [];
      tempSearch.value = [];
    } else {
      var capitalize = data.substring(0, 1).toUpperCase() + data.substring(1);
      if (queryAwal.isEmpty && data.length == 1) {
        // fungsi yang akan di jalankan pada 1 huruf ketikan pertama
        CollectionReference users = await firestore.collection("users");
        final keyNameResult = await users
            .where("keyName", isEqualTo: data.substring(0, 1).toUpperCase())
            .where("email", isNotEqualTo: email)
            .get();

        print("TOTAL DATA : ${keyNameResult.docs.length}");
        if (keyNameResult.docs.length > 1) {
          for (int i = 0; i < keyNameResult.docs.length; i++) {
            queryAwal.add(keyNameResult.docs[i].data() as Map<String, dynamic>);
          }

          print("QUERY RESULT : ");
          print(queryAwal);
        } else {
          print("TIDAK ADA DATA");
        }

        if (queryAwal.isNotEmpty) {
          tempSearch.value = [];
          for (var element in queryAwal) {
            if (element['name'].startsWith(capitalize)) {
              tempSearch.add(element);
            }
          }
        }
      }
    }
    queryAwal.refresh();
    tempSearch.refresh();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
