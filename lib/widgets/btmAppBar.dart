import 'package:flutter/material.dart';
import 'package:fruitsapp/home.dart';
import 'package:fruitsapp/search.dart';

class CustomBottomBar extends StatelessWidget {
  final BuildContext context;
  final double heightScreen;
  final double widthScreen;
  final double appBarheight;
  final double appBarWidth;
  final double appBarIconHeight;
  final double appBarBorderHeight;

  CustomBottomBar(
      {@required this.context,
      @required this.heightScreen,
      @required this.widthScreen,
      this.appBarheight = 0.07,
      this.appBarWidth = 1,
      this.appBarIconHeight = 0.04,
      this.appBarBorderHeight = 0.01});

  Widget buildTopBorder() {
    return Container(
      height: this.heightScreen * this.appBarBorderHeight,
      width: this.widthScreen * this.appBarWidth,
      color: Colors.grey[300],
    );
  }

  Widget buildIconsRow() {
    double rowHeight = this.heightScreen * this.appBarheight -
        this.heightScreen * this.appBarBorderHeight;
    double iconSize = this.heightScreen * this.appBarIconHeight;
    IconButton(
        iconSize: iconSize,
        color: Theme.of(context).primaryColor,
        icon: Icon(Icons.home),
        onPressed: () {
          print('on a cliqué sur trends');
        });
    return Container(
      color: Colors.white,
      width: this.widthScreen * this.appBarWidth,
      height: rowHeight,
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            iconSize: iconSize,
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          IconButton(
            iconSize: iconSize,
            color: Colors.green[300],
            icon: Icon(Icons.nature),
            onPressed: () {
              print('On a presser le jardin');
            },
          ),
          IconButton(
            iconSize: iconSize,
            color: Color(0xFFB7B7B7),
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
          ),
          IconButton(
              iconSize: iconSize,
              color: Color(0xFFB7B7B7),
              icon: Icon(Icons.settings),
              onPressed: () {
                print('on a cliqué sur les réglages');
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.heightScreen * this.appBarheight,
      width: this.widthScreen * this.appBarWidth,
      child: Column(
        children: <Widget>[buildTopBorder(), buildIconsRow()],
      ),
    );
  }
}
