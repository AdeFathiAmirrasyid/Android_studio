import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/app/routes/app_pages.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PageIndexController extends GetxController {
  RxInt pageIndex = 0.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void changePage(int i) async {
    switch (i) {
      case 1:
        Map<String, dynamic> dataResponse = await determinePosition();
        if (!dataResponse["error"]) {
          Position position = dataResponse["position"];

          List<Placemark> placemarks = await placemarkFromCoordinates(
              position.latitude, position.longitude);
          String address =
              "${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].subAdministrativeArea}, ${placemarks[0].country}";

          await updatePosition(position, address);
          //cek distance between 2 coordinate position
          double distanse = Geolocator.distanceBetween(
              -6.603899, 108.4770519, position.latitude, position.longitude);

          // presensi
          await presensi(position, address, distanse);
        } else {
          print("jalankan error");
          Get.snackbar("Terjadi Kesalahan", dataResponse["message"]);
        }

        print("selesai");
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.PROFILE);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.HOME);
    }
  }

  Future<void> presensi(
      Position position, String address, double distanse) async {
    String uid = auth.currentUser!.uid;
    CollectionReference<Map<String, dynamic>> collectionPrecense =
        firestore.collection("pegawai").doc(uid).collection('presence');
    QuerySnapshot<Map<String, dynamic>> snapshotPresence =
        await collectionPrecense.get();
    DateTime dateTime = DateTime.now();
    String todayDocId = DateFormat.yMd().format(dateTime).replaceAll("/", "-");
    String status = "Diluar Area";
    if (distanse <= 2000) {
      // didalam area
      status = "Didalam Area";
    }

    if (snapshotPresence.docs.isEmpty) {
      // belum pernah absen & set absen masuk pertama kalinya
      await Get.defaultDialog(
          title: "Validasi Presensi",
          middleText:
              "Apakah kamu yakin akan mengisi daftar hadir (masuk) sekarang?",
          actions: [
            OutlinedButton(
                onPressed: () => Get.back(), child: const Text("CANCEL")),
            ElevatedButton(
                onPressed: () async {
                  await collectionPrecense.doc(todayDocId).set({
                    "date": dateTime.toIso8601String(),
                    "masuk": {
                      "date": dateTime.toIso8601String(),
                      "lat": position.latitude,
                      "lomg": position.longitude,
                      "address": address,
                      "status": status,
                      "distance": distanse
                    }
                  });
                  Get.back();
                  Get.snackbar(
                      "Berhasil", "Kamu telah mengisi daftar hadir (MASUK)");
                },
                child: const Text("YA"))
          ]);
    } else {
      // sudah pernah absen -> cek hari ini udah absen masuk/keluar belum?
      DocumentSnapshot<Map<String, dynamic>> todayDoc =
          await collectionPrecense.doc(todayDocId).get();
      if (todayDoc.exists == true) {
        // tinggal absen keluar atau sudah absen masuk dan keluar
        Map<String, dynamic>? dataPresenceToday = todayDoc.data();
        if (dataPresenceToday?["keluar"] != null) {
          // sudah absen masuk & keluar
          Get.snackbar("Informasi Penting",
              "Kamu telah absen masuk & keluar. tidak dapat mengubah data kembali.");
        } else {
          // Absen keluar
          await Get.defaultDialog(
              title: "Validasi Presensi",
              middleText:
                  "Apakah kamu yakin akan mengisi daftar hadir ( KELUAR ) sekarang?",
              actions: [
                OutlinedButton(
                    onPressed: () => Get.back(), child: const Text("CANCEL")),
                ElevatedButton(
                    onPressed: () async {
                      await collectionPrecense.doc(todayDocId).update({
                        "keluar": {
                          "date": dateTime.toIso8601String(),
                          "lat": position.latitude,
                          "lomg": position.longitude,
                          "address": address,
                          "status": status,
                          "distance": distanse
                        }
                      });

                      Get.back();
                      Get.snackbar("Berhasil",
                          "Kamu telah mengisi daftar hadir ( KELUAR )");
                    },
                    child: const Text("YA"))
              ]);
        }
      } else {
        // absen masuk
        await Get.defaultDialog(
            title: "Validasi Presensi",
            middleText:
                "Apakah kamu yakin akan mengisi daftar hadir (masuk) sekarang?",
            actions: [
              OutlinedButton(
                  onPressed: () => Get.back(), child: const Text("CANCEL")),
              ElevatedButton(
                  onPressed: () async {
                    await collectionPrecense.doc(todayDocId).set({
                      "date": dateTime.toIso8601String(),
                      "masuk": {
                        "date": dateTime.toIso8601String(),
                        "lat": position.latitude,
                        "lomg": position.longitude,
                        "address": address,
                        "status": status,
                        "distance": distanse
                      }
                    });

                    Get.back();
                    Get.snackbar(
                        "Berhasil", "Kamu telah mengisi daftar hadir (MASUK)");
                  },
                  child: const Text("YA"))
            ]);
      }
    }
  }

  Future<void> updatePosition(Position position, String address) async {
    String uid = auth.currentUser!.uid;
    await firestore.collection("pegawai").doc(uid).update({
      "position": {
        "lat": position.latitude,
        "long": position.longitude,
      },
      "address": address
    });
  }

  Future<Map<String, dynamic>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // return Future.error('Location services are disabled.');
      return {
        "message": "Tidak dapat mengambil GPS dari device ini",
        "error": true
      };
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        // return Future.error('Location permissions are denied');
        return {"message": "Izin menggunakan GPS ditolak.", "error": true};
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      return {
        "message":
            "Settingkan hp kamu tidak memperbolehkan untuk mengakses GPS. Ubah pada settingan hp kamu.",
        "error": true
      };
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    );
    return {
      "position": position,
      "message": "Berhasil mendapatkan posisi device",
      "error": false
    };
  }
}
