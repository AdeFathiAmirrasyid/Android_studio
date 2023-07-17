import 'package:get/get.dart';

import '../models/province_model.dart';

class ProvinceProvider extends GetConnect {

  Future<Province?> getProvince(int id) async {
    final response = await get('province/$id');
    return response.body;
  }



}
