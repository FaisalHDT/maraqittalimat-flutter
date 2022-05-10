import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:maraqittalmiat/app/modules/alquran/controllers/alquran_controller.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';

import '../app/data/models/surah.dart';
import '../app/routes/app_pages.dart';

class SearchSurah extends SearchDelegate {
  final AlquranController pageC = Get.put(AlquranController());
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: pageC.getAllSurah(query: query),
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
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[200],
                      backgroundImage:
                          const AssetImage("assets/img/border.png"),
                      child: Padding(
                        padding: EdgeInsets.all(5),
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
                          fontSize: AppDimensions.font20, fontFamily: 'lpmq'),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/img/kosong.json",
              width: AppDimensions.pageVieewContainer,
              height: AppDimensions.pageVieewContainer),
          Text("Cari Surah"),
        ],
      ),
    );
  }
}
