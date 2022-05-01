import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:spotlight_app/ApiConstants.dart';
import 'package:spotlight_app/RecalledProduct.dart';

class ApiService {
  Future<List<RecalledProduct>?> getProducts() async {
    List<RecalledProduct>? db = <RecalledProduct>[];
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        db = recalledProductFromJson(response.body);
        log(db[0].toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return db;
  }
}
