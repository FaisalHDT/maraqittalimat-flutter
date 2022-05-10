import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maraqittalmiat/app/data/models/products.dart';

class BeritaController extends GetxController {
  Future<List<Products>> getBerita() async {
    Uri url = Uri.parse("http://10.0.2.2:3000/products/");

    var res = await http.get(url);
    // var data = json.decode(res.body);
    List? data = (json.decode(res.body));

    if (data == null || data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Products.fromJson(e)).toList();
    }
  }
}
