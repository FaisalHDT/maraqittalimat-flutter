import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maraqittalmiat/utils/bottom_navbar.dart';

import '../../../../widgets/app_bar.dart';
import '../../../controllers/page_index_controller.dart';
import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGlobal(
        appBar: AppBar(
          elevation: 0.0,
        ),
      ),
      body: Center(
        child: Text(
          'DoaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }
}
