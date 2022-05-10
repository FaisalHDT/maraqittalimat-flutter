import 'package:get/get.dart';

import '../controllers/quran_detail_controller.dart';

class QuranDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuranDetailController>(
      () => QuranDetailController(),
    );
  }
}
