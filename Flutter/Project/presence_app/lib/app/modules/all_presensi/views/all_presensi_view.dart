import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/app/routes/app_pages.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../controllers/all_presensi_controller.dart';

class AllPresensiView extends GetView<AllPresensiController> {
  const AllPresensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SEMUA PRESENSI'),
        centerTitle: true,
      ),
      body: GetBuilder<AllPresensiController>(
        builder: (controller) =>
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: controller.getPresence(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.data?.docs.length == 0 || snapshot.data == null) {
              return const SizedBox(
                height: 150,
                child: Center(child: Text("Belum ada history presensi")),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = snapshot.data!.docs[index].data();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Material(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () =>
                          Get.toNamed(Routes.DETAIL_PRESENSI, arguments: data),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Masuk",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(DateFormat.yMMMEd()
                                    .format(DateTime.parse(data['date']))),
                              ],
                            ),
                            Text(data['masuk']?['date'] == null
                                ? "-"
                                : DateFormat.jms().format(
                                    DateTime.parse(data['masuk']['date']))),
                            const SizedBox(height: 10),
                            const Text("Keluar",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(data['keluar']?['date'] == null
                                ? "-"
                                : DateFormat.jms().format(
                                    DateTime.parse(data['keluar']['date']))),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //syncfusion_flutter_datepicker
          Get.dialog(Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 400,
              child: SfDateRangePicker(
                monthViewSettings:
                    const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
                selectionMode: DateRangePickerSelectionMode.range,
                showActionButtons: true,
                onCancel: () => Get.back(),
                onSubmit: (obj) {
                  if (obj != null) {
                    if ((obj as PickerDateRange).endDate != null) {
                      // proses
                      controller.pickDate((obj).startDate!, (obj).endDate!);
                    }
                  }
                },
              ),
            ),
          ));
        },
        child: const Icon(Icons.format_list_bulleted_rounded),
      ),
    );
  }
}
