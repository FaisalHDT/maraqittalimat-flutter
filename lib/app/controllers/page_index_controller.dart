import 'package:get/get.dart';
import 'package:maraqittalmiat/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageIndexController extends GetxController {
  RxInt pageIndexC = 0.obs;

  void changePage(int i) async {
    switch (i) {
      case 1:
        pageIndexC.value = i;
        Get.offAllNamed(Routes.ALQURAN);
        break;
      case 2:
        pageIndexC.value = i;

        Get.offAllNamed(Routes.AURAD);
        break;
      case 3:
        pageIndexC.value = i;
        Get.offAllNamed(Routes.YOUTUBE_VIDEO);
        break;
      case 4:
        pageIndexC.value = i;
        Get.offAllNamed(Routes.BERITA);
        break;
      default:
        pageIndexC.value = i;
        Get.offAllNamed(Routes.HOME);
    }
  }
}
