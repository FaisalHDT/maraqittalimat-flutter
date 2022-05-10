import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maraqittalmiat/utils/bottom_navbar.dart';
import 'package:maraqittalmiat/widgets/koneksi.dart';

import '../../../../widgets/app_bar.dart';
import '../../../controllers/page_index_controller.dart';
import '../../../data/models/products.dart';
import '../controllers/berita_controller.dart';

class BeritaView extends GetView<BeritaController> {
  final pageC = Get.find<PageIndexController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGlobal(
        appBar: AppBar(
          elevation: 0.0,
        ),
      ),
      body: FutureBuilder<List<Products>>(
          future: controller.getBerita(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: CekKoneksi(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text("${snapshot.data![index].description}"),
                  );
                });
          }),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }
}
