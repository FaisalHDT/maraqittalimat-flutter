import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:maraqittalmiat/app/controllers/page_index_controller.dart';
import 'package:maraqittalmiat/app/data/models/detail_surah.dart';
import 'package:maraqittalmiat/utils/colors.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';
import 'package:maraqittalmiat/widgets/koneksi.dart';

import '../../../data/models/surah.dart';
import '../controllers/quran_detail_controller.dart';

class QuranDetailView extends GetView<QuranDetailController> {
  Surah? surah = Get.arguments;
  final PageIndexController sharedC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgGreen,
        appBar: AppBar(
          elevation: 0,
          title: Text(
              "${surah?.name?.transliteration?.id?.toUpperCase() ?? "Error" 'Error...'}"),
          centerTitle: true,
          actions: [
            Obx(() => Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      value: controller.isSwitched.value,
                      onChanged: (value) => {controller.changeSwitch()},
                      activeColor: Colors.yellow,
                      trackColor: Colors.white,
                      thumbColor: Colors.green[500]),
                ))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(AppDimensions.height20),
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(AppDimensions.height15),
              onTap: () {
                Get.defaultDialog(
                    backgroundColor: AppColors.bgGreen,
                    title: "TAFSIR",
                    content: Container(
                      padding: EdgeInsets.all(AppDimensions.height5),
                      child: Text(
                        "${surah?.tafsir?.id ?? "Tidak ada tafsir"}",
                        textAlign: TextAlign.justify,
                      ),
                    ));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: AppDimensions.height10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.green100, AppColors.green500],
                    ),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.height10)),
                // color: Colors.green[100],
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.height20),
                  child: Column(
                    children: [
                      Text(
                        "${surah?.name?.transliteration?.id?.toUpperCase() ?? "Error" 'Error...'}",
                        style: TextStyle(
                          fontSize: AppDimensions.font26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "﴾ ${surah?.name?.translation?.id?.toUpperCase() ?? "Error" 'Error...'} ﴿",
                        style: TextStyle(
                          fontSize: AppDimensions.font20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: AppDimensions.height10,
                      ),
                      Text(
                        "${surah?.numberOfVerses} Ayat | ${surah?.revelation?.id ?? "Error.."}",
                        style: TextStyle(
                          fontSize: AppDimensions.font16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: AppDimensions.height10,
            ),
            FutureBuilder<DetailSurah>(
                future: controller.getDetailSurah(surah!.number.toString()),
                builder: (context, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: SpinKitFadingCube(
                        color: Colors.green,
                        size: AppDimensions.height45,
                      ),
                    );
                  }
                  if (!snap.hasData) {
                    return CekKoneksi();
                  }
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snap.data!.numberOfVerses,
                      itemBuilder: (context, index) {
                        return Container(
                          // padding: EdgeInsets.all(AppDimensions.height10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(
                                        AppDimensions.height10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: AppDimensions.height10),
                                      child: Container(
                                        height: AppDimensions.height45,
                                        width: AppDimensions.height45,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/img/star.png"),
                                                fit: BoxFit.contain)),
                                        child: Center(
                                          child: Text(
                                            "${snap.data!.verses![index].number!.inSurah}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font20,
                                                fontFamily: 'maddina',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            controller.shareText(
                                                "${snap.data!.verses![index].text!.arab} \n ${snap.data!.verses![index].translation!.id}");
                                          },
                                          icon: Icon(
                                            Icons.share_outlined,
                                          ),
                                        ),
                                        Obx(() => IconButton(
                                              onPressed: () {
                                                var uri = snap
                                                    .data!.verses![index].audio
                                                    .toString();
                                                controller.getAudio(
                                                    "${snap.data!.verses![index].audio!.primary.toString()}",
                                                    index);
                                              },
                                              icon: index + 1 ==
                                                          controller.inSelected
                                                              .value &&
                                                      controller
                                                              .playing.value ==
                                                          true
                                                  ? Icon(Icons.pause)
                                                  : Icon(Icons.play_arrow),
                                            )),
                                        IconButton(
                                          onPressed: () {
                                            controller.tandaiSurat("surat",
                                                "${snap.data!.name!.transliteration!.id} ayat ${snap.data!.verses![index].number!.inSurah}");
                                          },
                                          icon: Icon(
                                            Icons.bookmark_add_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: AppDimensions.height10,
                              ),
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: AppDimensions.height25),
                                  child: Text(
                                    "${snap.data!.verses![index].text!.arab} ",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: AppDimensions.height30,
                                        fontFamily: 'ali'),
                                  ),
                                ),
                              ),
                              Obx(() => Container(
                                    padding:
                                        EdgeInsets.all(AppDimensions.font16),
                                    child: controller.isSwitched.value != true
                                        ? Text(
                                            "${snap.data!.verses![index].translation!.id} ",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                fontSize: AppDimensions.font16,
                                                fontFamily: 'lpmq'),
                                          )
                                        : Container(),
                                  )),
                            ],
                          ),
                        );
                      });
                })
          ],
        ));
  }
}
