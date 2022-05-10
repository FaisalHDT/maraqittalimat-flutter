import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  CarouselController carouselController = CarouselController();
  RxBool current = false.obs;
  int count = 0;

  void changeIndex(int count) async {}
  final List<Widget> sliders = [
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.height10),
          color: Colors.green),
      width: AppDimensions.pageView * 2,
      height: AppDimensions.pageVieewContainer,
      child: Text("data1"),
    ),
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.height10),
          color: Colors.red),
      width: AppDimensions.pageView * 2,
      height: AppDimensions.pageVieewContainer,
      child: Text("data2"),
    ),
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.height10),
          color: Colors.yellow),
      width: AppDimensions.pageView * 2,
      height: AppDimensions.pageVieewContainer,
      child: Text("data1"),
    ),
  ];
}
