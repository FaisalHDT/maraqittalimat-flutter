import 'package:get/get.dart';

import '../modules/alquran/bindings/alquran_binding.dart';
import '../modules/alquran/views/alquran_view.dart';
import '../modules/audio/bindings/audio_binding.dart';
import '../modules/audio/views/audio_view.dart';
import '../modules/aurad/bindings/aurad_binding.dart';
import '../modules/aurad/views/aurad_view.dart';
import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/doa/bindings/doa_binding.dart';
import '../modules/doa/views/doa_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pesan/bindings/pesan_binding.dart';
import '../modules/pesan/views/pesan_view.dart';
import '../modules/quran_detail/bindings/quran_detail_binding.dart';
import '../modules/quran_detail/views/quran_detail_view.dart';
import '../modules/youtube_video/bindings/youtube_video_binding.dart';
import '../modules/youtube_video/views/youtube_video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.YOUTUBE_VIDEO,
        page: () => YoutubeVideoView(),
        binding: YoutubeVideoBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.PESAN,
        page: () => PesanView(),
        binding: PesanBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.BERITA,
        page: () => BeritaView(),
        binding: BeritaBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.DOA,
        page: () => DoaView(),
        binding: DoaBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.AURAD,
        page: () => AuradView(),
        binding: AuradBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.ALQURAN,
      page: () => AlquranView(),
      binding: AlquranBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: _Paths.QURAN_DETAIL,
        page: () => QuranDetailView(),
        binding: QuranDetailBinding(),
        transition: Transition.rightToLeft),
    GetPage(
      name: _Paths.AUDIO,
      page: () => AudioView(),
      binding: AudioBinding(),
    ),
  ];
}
