import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/app/controllers/page_index_controller.dart';
import 'package:presence_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageController = Get.find<PageIndexController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('HOME'),
          centerTitle: true,
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: controller.streamUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              Map<String, dynamic> user = snapshot.data!.data()!;
              String defaultImage =
                  "https://ui-avatars.com/api/?name${user['name']}";

              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 75,
                          height: 75,
                          color: Colors.grey[200],
                          child: Image.network(
                              user["profile"] != null
                                  ? user['profile']
                                  : defaultImage,
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(
                              width: 250,
                              child:
                                  Text(user['address'] ?? "Belum ada lokasi")),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user['job']}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${user['nip']}",
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${user['name']}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200]),
                    child: StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                        stream: controller.streamTodayPresence(),
                        builder: (context, snapshotToday) {
                          if (snapshotToday.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          Map<String, dynamic>? dataToday =
                              snapshotToday.data?.data();
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  const Text("Masuk"),
                                  Text(dataToday?['masuk'] == null
                                      ? "-"
                                      : DateFormat.jms().format(DateTime.parse(
                                          dataToday!['masuk']['date']))),
                                ],
                              ),
                              Container(
                                width: 2,
                                height: 40,
                                color: Colors.grey,
                              ),
                              Column(
                                children: [
                                  const Text("Keluar"),
                                  Text(dataToday?['keluar'] == null
                                      ? "-"
                                      : DateFormat.jms().format(DateTime.parse(
                                          dataToday!['masuk']['date']))),
                                ],
                              ),
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                  Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "last 5 days",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () => Get.toNamed(Routes.ALL_PRESENSI),
                          child: const Text("See more"))
                    ],
                  ),
                  const SizedBox(height: 20),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                      stream: controller.streamLastPresence(),
                      builder: (context, snapPresence) {
                        if (snapPresence.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapPresence.data?.docs.length == 0 ||
                            snapPresence.data == null) {
                          return const SizedBox(
                            height: 150,
                            child: Center(
                                child: Text("Belum ada history presensi")),
                          );
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapPresence.data?.docs.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                snapPresence.data!.docs[index].data();
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Masuk",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(DateFormat.yMMMEd().format(
                                                DateTime.parse(data['date']))),
                                          ],
                                        ),
                                        Text(data['masuk']?['date'] == null
                                            ? "-"
                                            : DateFormat.jms().format(
                                                DateTime.parse(
                                                    data['masuk']['date']))),
                                        const SizedBox(height: 10),
                                        const Text("Keluar",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        Text(data['keluar']?['date'] == null
                                            ? "-"
                                            : DateFormat.jms().format(
                                                DateTime.parse(
                                                    data['keluar']['date']))),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      })
                ],
              );
            } else {
              return const Center(
                  child: Text("Tidak dapat memuat database user."));
            }
          },
        ),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.fingerprint, title: 'Add'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: pageController.pageIndex.value,
          onTap: (int i) => pageController.changePage(i),
        ));
  }
}
