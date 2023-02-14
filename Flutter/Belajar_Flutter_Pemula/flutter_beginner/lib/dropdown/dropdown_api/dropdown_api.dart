import 'dart:convert';

import 'package:app/dropdown/dropdown_api/models/city.dart';
import 'package:app/dropdown/dropdown_api/models/desa.dart';
import 'package:app/dropdown/dropdown_api/models/kecamatan.dart';
import 'package:app/dropdown/dropdown_api/models/province.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  String apiKey =
      '781eb5041853650ef316bde9c5d4c44a86f1bd9444385d553798b7e3f38cb4eb';

  String? idProv;
  String? idKab;
  String? idKec;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Api Wilayah Indonesia"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownSearch<Province>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
              ),
              asyncItems: (value) async {
                var response = await http.get(Uri.parse(
                    "https://api.binderbyte.com/wilayah/provinsi?api_key=$apiKey"));

                if (response.statusCode != 200) {
                  return [];
                }
                List data = (json.decode(response.body)
                    as Map<String, dynamic>)['value'];
                List<Province> allProvince = [];

                for (var element in data) {
                  allProvince
                      .add(Province(id: element['id'], name: element['name']));
                }
                return allProvince;
              },
              onChanged: (value) {
                idProv = value?.id;
              },
              dropdownBuilder: (context, selectedItem) => ListTile(
                title: Text(selectedItem?.name ?? "Belum memilih province"),
              ),
            ),
            const SizedBox(height: 30),
            DropdownSearch<City>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              asyncItems: (text) async {
                var response = await http.get(Uri.parse(
                    "https://api.binderbyte.com/wilayah/kabupaten?api_key=$apiKey&id_provinsi=$idProv"));

                if (response.statusCode != 200) {
                  return [];
                }
                List data = (json.decode(response.body)
                    as Map<String, dynamic>)['value'];
                List<City> allCity = [];

                for (var element in data) {
                  allCity.add(City(
                      id: element['id'],
                      name: element['name'],
                      idProvince: element['id_provinsi']));
                }
                return allCity;
              },
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
              ),
              onChanged: (value) {
                idKab = value?.id;
              },
              dropdownBuilder: (context, selectedItem) => ListTile(
                title: Text(selectedItem?.name ?? "Belum memilih kota"),
              ),
            ),
            const SizedBox(height: 30),
            DropdownSearch<Kecamatan>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              asyncItems: (text) async {
                var response = await http.get(Uri.parse(
                    "https://api.binderbyte.com/wilayah/kecamatan?api_key=$apiKey&id_kabupaten=$idKab"));

                if (response.statusCode != 200) {
                  return [];
                }
                List data = (json.decode(response.body)
                    as Map<String, dynamic>)['value'];
                List<Kecamatan> allKab = [];

                for (var element in data) {
                  allKab.add(Kecamatan(
                      id: element['id'],
                      name: element['name'],
                      idKab: element['id_kabupaten']));
                }
                return allKab;
              },
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
              ),
              onChanged: (value) {
                idKec = value?.id;
              },
              dropdownBuilder: (context, selectedItem) => ListTile(
                title: Text(selectedItem?.name ?? "Belum memilih kecamatan"),
              ),
            ),
            const SizedBox(height: 30),
            DropdownSearch<Desa>(
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              asyncItems: (text) async {
                var response = await http.get(Uri.parse(
                    "https://api.binderbyte.com/wilayah/kelurahan?api_key=$apiKey&id_kecamatan=$idKec"));

                if (response.statusCode != 200) {
                  return [];
                }
                List data = (json.decode(response.body)
                    as Map<String, dynamic>)['value'];
                List<Desa> allKec = [];

                for (var element in data) {
                  allKec.add(Desa(
                      id: element['id'],
                      name: element['name'],
                      idKec: element['id_kecamatan']));
                }
                return allKec;
              },
              popupProps: PopupProps.menu(
                showSearchBox: true,
                itemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.name),
                ),
              ),
              onChanged: (value) {
                idKab = value?.id;
              },
              dropdownBuilder: (context, selectedItem) => ListTile(
                title: Text(selectedItem?.name ?? "Belum memilih desa"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
