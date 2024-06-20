import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_ease/app/model/home_data_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  var productList = <HomeDataModel>[].obs;
  Future<List<HomeDataModel>> getData() async {
    final response =
        await http.get(Uri.parse('https://api.restful-api.dev/objects'));

    log(response.body);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) as List;
      productList.value =
          jsonData.map((product) => HomeDataModel.fromJson(product)).toList();
    }
    return homeDataModelFromJson(response.body);
  }
}
