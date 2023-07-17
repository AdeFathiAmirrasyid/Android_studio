import 'dart:convert';

import 'package:cek_ongkir/app/data/models/ongkir_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController beratC = TextEditingController();
  RxString provAsalId = "0".obs;
  RxString cityAsalId = "0".obs;
  RxString provToId = "0".obs;
  RxString cityToId = "0".obs;

  RxBool isLoading = false.obs;

  List<Ongkir> ongkosKirim = [];

  RxString codeKurir = "".obs;

  void cekOngkir() async {
    if (provAsalId != "0" &&
        cityAsalId != "0" &&
        provToId != "0" &&
        cityToId != "0" &&
        codeKurir != "" &&
        beratC.text != "") {
      try {
        isLoading.value = true;
        var response = await http.post(
            Uri.parse("https://api.rajaongkir.com/starter/cost"),
            headers: {
              "key": "681a83765a164f843240298820d707d8",
              "content-type": "application/x-www-form-urlencoded"
            },
            body: {
              "origin": cityAsalId.value,
              "destination": cityToId.value,
              "weight": beratC.text,
              "courier": codeKurir.value
            });
        isLoading.value = false;
        List result =
            json.decode(response.body)['rajaongkir']['results'][0]['costs'];
        ongkosKirim = Ongkir.fromJsonList(result);

        Get.defaultDialog(
            title: "ONGKOS KIRIM",
            content: Column(
              children: ongkosKirim.map((e) => ListTile(
                title: Text(e.service!.toUpperCase()),
                subtitle: Text("Rp. ${e.cost![0].value}"),
              )).toList(),
            ));
      } catch (error) {
        print(error);
        Get.defaultDialog(
            title: "Terjadi Kesalahan",
            middleText: "Tidak dapat mengecek ongkos kirim");
      }
    } else {
      Get.defaultDialog(
          title: "Terjadi Kesalahan", middleText: "Data input belum lengkap");
    }
  }
}
