import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/item_dropdown_search_city.dart';
import '../../widgets/item_dropdown_search_city_tujuan.dart';
import '../../widgets/item_dropdown_search_province.dart';
import '../../widgets/item_dropdown_search_province_tujuan.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const ItemDropdownSearchProvince(),
            const SizedBox(height: 20),
            const ItemDropdownSearchCity(),
            const SizedBox(height: 20),
            const ItemDropdownSearchProvinceTujuan(),
            const SizedBox(height: 20),
            const ItemDropdownSearchCityTujuan(),
            const SizedBox(height: 20),
            TextField(
              controller: controller.beratC,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  labelText: "Berat (gram)",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 20),
            DropdownSearch<Map<String, dynamic>>(
              items: const [
                {"code": "jne", "name": "JNE"},
                {"code": "pos", "name": "POS Indonesia"},
                {"code": "tiki", "name": "TIKI"},
                {"code": "ninja", "name": "NINJA"},
                {"code": "lex_id", "name": "LEX_ID"}
              ],
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      labelText: "Pilih Kurir",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) =>
                    ListTile(title: Text("${item['name']}")),
              ),
              onChanged: (value) =>
                  controller.codeKurir.value = value?['code'] ?? "",
              dropdownBuilder: (context, selectedItem) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text("${selectedItem?['name'] ?? "Pilih kurir"}",
                    style: const TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => ElevatedButton(
                  onPressed: () {
                    if (controller.isLoading.isFalse) {
                      controller.cekOngkir();
                    }
                  },
                  child: Text(controller.isLoading.isFalse
                      ? "Cek Ongkos Kirim"
                      : "Loading...")),
            )
          ],
        ));
  }
}
