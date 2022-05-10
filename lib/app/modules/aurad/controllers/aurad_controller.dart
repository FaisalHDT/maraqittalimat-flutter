import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AuradController extends GetxController {
  RxBool isSwitched = false.obs;

  Future shareText(String text) async {
    var share = await Share.share("${text}");

    return share;
  }

  Future changeSwitch() async {
    if (isSwitched.isFalse) {
      isSwitched.value = true;
    } else {
      isSwitched.value = false;
    }
  }

  Future<List?> getAurad() async {
    final String response = await rootBundle.loadString('assets/db/aurad.json');

    List? data = json.decode(response);

    return data;
  }
}
