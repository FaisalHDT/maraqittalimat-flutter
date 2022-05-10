import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maraqittalmiat/utils/bottom_navbar.dart';
import 'package:maraqittalmiat/utils/colors.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';
import 'package:maraqittalmiat/widgets/koneksi.dart';

import '../../../controllers/page_index_controller.dart';
import '../controllers/aurad_controller.dart';

class AuradView extends GetView<AuradController> {
  final pageC = Get.find<PageIndexController>();
  List? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgGreen,
      appBar: AppBar(
        elevation: 0.0,
        leading: Container(
          padding: EdgeInsets.all(AppDimensions.height10),
          child: Image.asset(
            "assets/img/logofix.png",
            fit: BoxFit.cover,
          ),
        ),
        title: Text("AuradulMaraqiyah"),
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
      body: FutureBuilder<List<dynamic>?>(
          future: controller.getAurad(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (!snapshot.hasData) {
              return CekKoneksi();
            }

            return ListView.builder(
                padding: EdgeInsets.all(AppDimensions.height10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: AppDimensions.height10),
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius:
                                BorderRadius.circular(AppDimensions.height10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: AppDimensions.height45,
                              width: AppDimensions.height45,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/img/star.png"),
                                      fit: BoxFit.contain)),
                              child: Center(
                                child: Text(
                                  "${snapshot.data![index]['id']}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: AppDimensions.font20,
                                      fontFamily: 'maddina',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.bookmark_add_outlined,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.shareText(
                                        "${snapshot.data![index]["ayat"]} \n ${snapshot.data![index]['arti']}");
                                  },
                                  icon: Icon(
                                    Icons.share_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(AppDimensions.height10),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: AppDimensions.height25),
                          child: Text(
                            "${snapshot.data![index]['ayat']} ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: AppDimensions.height30,
                                fontFamily: 'ali'),
                          ),
                        ),
                      ),
                      Obx(
                        () => Container(
                          padding: EdgeInsets.all(AppDimensions.font16),
                          child: controller.isSwitched.value == false
                              ? Text(
                                  "${snapshot.data![index]['arti']} ",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: AppDimensions.font16,
                                      fontFamily: 'lpmq'),
                                )
                              : Container(),
                        ),
                      ),
                    ],
                  );
                });
          }),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }
}
