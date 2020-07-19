import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruitsapp/models/fruitsEtLegumes.dart';
import 'package:fruitsapp/widgets/btmAppBar.dart';
import 'package:fruitsapp/widgets/customText.dart';

class PageDetail extends StatefulWidget {
  // Declare a field that holds the Todo.
  final FruitsEtLegumes fruitAndLegumes;

  // In the constructor, require a Todo.
  PageDetail({Key key, @required this.fruitAndLegumes});
  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  double _screenWidth;
  double _screenHeight;
  bool ajouter = false;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    // Use the Todo to create the UI.
    return GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
        child: (Platform.isIOS)
            ? CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  middle: CustomText(
                      text: widget.fruitAndLegumes.name,
                      fontColor: FontColor.white,
                      fontSize: FontSize.lg),
                ),
                child: body(),
              )
            //CupertinoTabScaffold(tabBar: CustomBottomBar(context: context,heightScreen: _screenHeight,widthScreen: _screenWidth,)
            : Scaffold(
                appBar: AppBar(
                  title: Text(
                    widget.fruitAndLegumes.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                body: body(),
                bottomNavigationBar: CustomBottomBar(
                  context: context,
                  heightScreen: _screenHeight,
                  widthScreen: _screenWidth,
                ),
              ));
  }

  Widget switchPlatform() {
    if (Platform.isIOS) {
      return CupertinoSwitch(
          value: ajouter,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (bool b) {
            setState(() {
              ajouter = b;
            });
          });
    } else {
      return Switch(
          value: ajouter,
          activeTrackColor: Theme.of(context).primaryColor,
          onChanged: (bool b) {
            setState(() {
              ajouter = b;
            });
          });
    }
  }

  Widget body() {
    return new Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset("fruits assets/${widget.fruitAndLegumes.img}"),
        Container(
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 25.0)),
              CustomText(
                text: widget.fruitAndLegumes.name,
                fontColor: FontColor.dark,
                fontSize: FontSize.xl,
                fontWeight: FontWeight.bold,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              CustomText(
                text: widget.fruitAndLegumes.shortDescription,
                fontColor: FontColor.dark,
                fontSize: FontSize.md,
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFFFF8152)),
                    left: BorderSide(width: 1.0, color: Color(0xFFFF8152)),
                    right: BorderSide(width: 1.0, color: Color(0xFFFF8152)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFFFF8152)),
                  ),
                ),
                margin: EdgeInsets.all(10.0),
                child: CustomText(
                    text: '''
                          Portion par service: ${widget.fruitAndLegumes.portion} 
                          Calories: ${widget.fruitAndLegumes.calories.toString()}kCal
                          Vitamines A: ${widget.fruitAndLegumes.vitA.toString()}% DV
                          Vitamines C: ${widget.fruitAndLegumes.vitC.toString()}% DV
                          ''',
                    fontColor: FontColor.darkGrey,
                    fontSize: FontSize.sm),
              ),
              Padding(padding: EdgeInsets.only(top: 5.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  switchPlatform(),
                  CustomText(
                    text: "Ajouter à mon jardin",
                    fontColor: FontColor.darkGrey,
                    fontSize: FontSize.md,
                  ),
                ],
              )
            ],
          )),
        )
      ],
    ));
  }
}
