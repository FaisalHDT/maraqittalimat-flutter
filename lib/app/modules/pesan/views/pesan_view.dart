import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maraqittalmiat/utils/bottom_navbar.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/pesan_controller.dart';

class PesanView extends GetView<PesanController> {
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PesanView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PesanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }
}
