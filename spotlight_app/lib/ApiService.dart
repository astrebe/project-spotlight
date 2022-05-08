import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:spotlight_app/ApiConstants.dart';
import 'package:spotlight_app/RecalledProductDatabase.dart';
import "DatabaseStorage.dart";

class ApiService {
  Future<RecalledProductDB> getProducts() async {
    RecalledProductDB db = RecalledProductDB();
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        db.recalledProductDBFromJson(response.body);
        DatabaseStorage().writeDatabaseCache(response.body);
      }
    } catch (e) {
      log(e.toString());
    }
    return db;
  }
}
