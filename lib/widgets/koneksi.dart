import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:maraqittalmiat/utils/dimensions.dart';

class CekKoneksi extends StatelessWidget {
  const CekKoneksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(AppDimensions.height50),
        child: Lottie.asset(
          "assets/img/nosignal.json",
        ),
      ),
    );
  }
}
