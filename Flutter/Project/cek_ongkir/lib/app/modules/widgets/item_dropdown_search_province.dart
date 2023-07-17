import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cek_ongkir/app/data/models/province_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../home/controllers/home_controller.dart';

class ItemDropdownSearchProvince extends GetView<HomeController> {
  const ItemDropdownSearchProvince({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Province>(
      popupProps: PopupProps.menu(
        showSearchBox: true,
        itemBuilder: (context, item, isSelected) => ListTile(
          title: Text("${item.province}"),
        ),
      ),
      asyncItems: (text) async {
        var response = await Dio().get(
          "https://api.rajaongkir.com/starter/province",
          queryParameters: {"key": "681a83765a164f843240298820d707d8"},
        );
        var models =
            Province.fromJsonList(response.data["rajaongkir"]["results"]);
        return models;
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Provinsi Asal",
        ),
      ),
      dropdownBuilder: (context, selectedItem) => Text(
          selectedItem != null ? "${selectedItem.province}" : "Pilih Provinsi"),
      onChanged: (value) => controller.provAsalId.value = value?.provinceId ?? "0",
    );
  }
}
