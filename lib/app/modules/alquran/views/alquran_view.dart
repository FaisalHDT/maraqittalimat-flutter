import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:maraqittalmiat/app/routes/app_pages.dart';

import 'package:maraqittalmiat/utils/bottom_navbar.dart';
import 'package:maraqittalmiat/utils/colors.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';
import 'package:maraqittalmiat/utils/search.dart';
import 'package:maraqittalmiat/widgets/app_bar.dart';

import '../../../controllers/page_index_controller.dart';
import '../../../data/models/surah.dart';
import '../controllers/alquran_controller.dart';

class AlquranView extends GetView<AlquranController> {
  final pageC = Get.find<PageIndexController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGreen,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Surah"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchSurah());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: AppDimensions.height10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.green100, AppColors.green500],
                  ),
                  borderRadius: BorderRadius.circular(AppDimensions.height10)),
              // color: Colors.green[100],
              child: Padding(
                padding: EdgeInsets.all(AppDimensions.height20),
                child: FutureBuilder(
                    future: controller.takeSurah('surat'),
                    builder: (context, snap) {
                      return Text(
                        controller.isi,
                        style: TextStyle(
                          fontSize: AppDimensions.font26,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }),
              )),
          FutureBuilder<List<Surah>>(
              future: controller.getAllSurah(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitFadingCube(
                      color: Colors.green,
                      size: AppDimensions.height45,
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: Lottie.asset("assets/img/kosong.json",
                        width: AppDimensions.height45,
                        height: AppDimensions.height45),
                  );
                }

                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Surah surah = snapshot.data![index];
                      return Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(0, 83, 79, 1),
                                    width: 0.1))),
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(Routes.QURAN_DETAIL, arguments: surah);
                          },
                          leading: Container(
                            height: AppDimensions.height45,
                            width: AppDimensions.height45,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/img/star.png"),
                                    fit: BoxFit.contain)),
                            child: Center(
                              child: Text(
                                "${surah.number}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: AppDimensions.font16 - 3),
                              ),
                            ),
                          ),
                          title: Text(
                            "${surah.name?.transliteration?.id ?? "Error"}",
                            style: TextStyle(color: Colors.green),
                          ),
                          subtitle: Text(
                              "${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? "Error.."}"),
                          trailing: Text(
                            "${surah.name?.short ?? "Error.."}",
                            style: TextStyle(
                                fontSize: AppDimensions.font20,
                                fontFamily: 'lpmq'),
                          ),
                        ),
                      );
                    });
              })
        ],
      ),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }
}
