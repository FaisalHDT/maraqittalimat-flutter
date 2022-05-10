import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:maraqittalmiat/app/data/models/surah.dart';

class AlquranController extends GetxController {
  List<Surah> result = [];
  var isi;

  Future takeSurah(String key) async {
    await GetStorage.init();
    final box = GetStorage();
    isi = box.read('${key}');
    print(isi);
    return isi;
  }

  Future<List<Surah>> getAllSurah({String? query}) async {
    Uri url = Uri.parse("https://api.quran.sutanlab.id/surah/");
    var res = await http.get(url);

    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    if (data == null || data.isEmpty) {
      return [];
    } else {
      result = data.map((e) => Surah.fromJson(e)).toList();
      if (query != null) {
        result = result
            .where((element) => element.name!.transliteration!.id!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
      return result;
    }
  }
}
