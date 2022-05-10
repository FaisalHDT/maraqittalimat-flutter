import 'package:get/get.dart';

import '../controllers/aurad_controller.dart';

class AuradBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuradController>(
      () => AuradController(),
    );
  }
}
