import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/controllers/page_index_controller.dart';
import 'app/routes/app_pages.dart';

void main() {
  final pageC = Get.put(PageIndexController(), permanent: true);
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ),
    ),
  ));
}
