import 'dart:developer';

import 'package:buttercmslandingpage/const.dart';
import 'package:http/http.dart' as http;

import 'api_data_model.dart';

class ApiService {
  Welcome welcome = Welcome();
  String? image;

  Future<Welcome?> getData() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData = Welcome.fromJson(response.body);
        welcome = responseData;
        return welcome;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
