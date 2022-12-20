import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class ItemView extends GetView<HomeController> {
  ItemView(this.data);
  final data;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.EDIT, arguments: data.id!),
      leading: const CircleAvatar(),
      title: Text(data.name!),
      subtitle: Text(data.createdAt!),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () => controller.delete(data.id!),
      ),
    );
  }
}
