import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../app/controllers/page_index_controller.dart';

class NavbarBottom extends StatelessWidget {
  const NavbarBottom({
    Key? key,
    required this.pageC,
  }) : super(key: key);

  final PageIndexController pageC;

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: Colors.green,
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.book_rounded, title: 'Alqur\'an'),
        TabItem(
            icon: Image.asset(
              "assets/img/logofix.png",
              fit: BoxFit.scaleDown,
            ),
            title: 'Add'),
        TabItem(icon: Icons.play_circle, title: 'Video'),
        TabItem(icon: Icons.newspaper, title: 'Berita'),
      ],
      initialActiveIndex: pageC.pageIndexC.value, //optional, default as 0
      onTap: (int i) => pageC.changePage(i),
    );
  }
}
