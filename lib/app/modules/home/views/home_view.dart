import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maraqittalmiat/app/routes/app_pages.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';
import '../../../../utils/bottom_navbar.dart';
import '../../../../widgets/app_bar.dart';
import '../../../controllers/page_index_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final pageC = Get.find<PageIndexController>();
  CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarGlobal(
        appBar: AppBar(),
      ),
      body: ListView(
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: AppDimensions.height20),
              child: CarouselSlider(
                items: controller.sliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      controller.count = index;

                      print(index);
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: controller.sliders.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (controller.count <= entry.key
                            ? Colors.grey
                            : Colors.black)
                        // .withOpacity(controller.current.isFalse
                        //     ? controller.count == entry.key
                        //         ? 0.9
                        //         : 0.4
                        //     : 0.4)
                        ),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Card(
                    color: Colors.green,
                    child: IconButton(
                      icon: Icon(Icons.music_note),
                      onPressed: () {
                        Get.toNamed(Routes.AUDIO);
                      },
                    ),
                  ),
                ),
              ],
            )
          ])
        ],
      ),
      bottomNavigationBar: NavbarBottom(pageC: pageC),
    );
  }
}
