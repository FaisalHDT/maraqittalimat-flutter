import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';

class AppbarGlobal extends StatelessWidget implements PreferredSizeWidget {
  AppbarGlobal({Key? key, required this.appBar}) : super(key: key);
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Text('Maraqitta\'limat'),
      actions: [
        Container(
          margin: EdgeInsets.only(right: AppDimensions.height10),
          child: Center(
            child: Badge(
              position: BadgePosition.topEnd(top: 0, end: 2),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                '2',
                style: TextStyle(color: Colors.white),
              ),
              child:
                  IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            ),
          ),
        )
      ],
      leading: Container(
        padding: EdgeInsets.all(AppDimensions.height10),
        child: Image.asset(
          "assets/img/logofix.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
