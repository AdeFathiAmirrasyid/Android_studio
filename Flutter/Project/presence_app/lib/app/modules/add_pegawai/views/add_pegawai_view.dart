import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pegawai_controller.dart';

class AddPegawaiView extends GetView<AddPegawaiController> {
  const AddPegawaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD PEGAWAI'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.nipController,
            autocorrect: false,
            decoration: const InputDecoration(
                labelText: "NIP", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller.nameController,
            autocorrect: false,
            decoration: const InputDecoration(
                labelText: "Name", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller.jobController,
            autocorrect: false,
            decoration: const InputDecoration(
                labelText: "Job", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: controller.emailController,
            autocorrect: false,
            decoration: const InputDecoration(
                labelText: "Email", border: OutlineInputBorder()),
          ),
          const SizedBox(height: 30),
          Obx(
            () => ElevatedButton(
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    await controller.addPegawai();
                  }
                },
                child: Text(controller.isLoading.isFalse
                    ? "ADD PEGAWAI"
                    : "LOADING...")),
          )
        ],
      ),
    );
  }
}
