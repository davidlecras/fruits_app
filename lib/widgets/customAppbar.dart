import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;
  final double heightScreen;
  final double widthScreen;
  final double appBarHeight;
  final double appBarWidth;
  final double appBarLogoHeight;
  final double appBarIconHeight;

  CustomAppbar({
    @required this.context,
    @required this.heightScreen,
    @required this.widthScreen,
    this.appBarHeight = 0.05,
    this.appBarWidth = 1.0,
    this.appBarLogoHeight = 0.028,
    this.appBarIconHeight = 0.028,
  });

  Widget buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        "Mes fruits et légumes",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(this.context).primaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildAppBar();
  }

  Size get preferredSize =>
      Size(widthScreen * appBarWidth, heightScreen * appBarHeight);
}
