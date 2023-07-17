import 'package:cek_ongkir/app/data/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../home/controllers/home_controller.dart';

class ItemDropdownSearchCityTujuan extends GetView<HomeController> {
  const ItemDropdownSearchCityTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<City>(
      popupProps: PopupProps.menu(
        showSearchBox: true,
        itemBuilder: (context, item, isSelected) => ListTile(
          title: Text("${item.type} ${item.cityName}"),
        ),
      ),
      asyncItems: (text) async {
        var response = await Dio().get(
          "https://api.rajaongkir.com/starter/city?province=${controller.provToId}",
          queryParameters: {"key": "681a83765a164f843240298820d707d8"},
        );
        var models =
        City.fromJsonList(response.data["rajaongkir"]["results"]);
        return models;
      },
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Kota Tujuan",
        ),
      ),
      dropdownBuilder: (context, selectedItem) => Text(
          selectedItem != null ? "${selectedItem.cityName}" : "Pilih Kota"),
      onChanged:  (value) => controller.cityToId.value = value?.cityId ?? "0",
    );
  }
}
