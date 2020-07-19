import 'package:flutter/material.dart';
import "package:fruitsapp/models/fruitsEtLegumes.dart";
import 'package:fruitsapp/widgets/btmAppBar.dart';
import 'package:fruitsapp/widgets/customAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruitsapp/widgets/customText.dart';
import 'dart:io';
import "page_detail.dart";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _screenWidth;
  double _screenHeight;

  final List<FruitsEtLegumes> listeFetL = [
    new FruitsEtLegumes(1, "Artichaut", "Un légume bien fleuri",
        "3 petit coeurs par repas", 70, 80, 160, "artichoke.jpg"),
    new FruitsEtLegumes(2, "Asperges", "Blanche ou verte, c'est en entrée",
        "6 asperges par repas", 100, 100, 160, "asparagus.jpg"),
    new FruitsEtLegumes(3, "Aubergines", "Aussi beau que bon",
        "1/2 aubergine par repas", 70, 80, 160, "eggplant.jpg"),
    new FruitsEtLegumes(
        4,
        "Bananes",
        "Très riche en potassium, ça vous donne la banane",
        "1 banane par repas",
        70,
        80,
        160,
        "banana.jpg"),
    new FruitsEtLegumes(
        5,
        "Carottes",
        "De toutes les couleurs, de toutes les envies",
        " 2 carottes par repas",
        70,
        80,
        160,
        "carrots.jpg"),
    new FruitsEtLegumes(6, "Citrouille", "C'est pas que pour Halloween",
        "1/4 de citrouille par repas", 70, 80, 160, "pumpkin.jpg"),
    new FruitsEtLegumes(
        7,
        "Fraise",
        "Un fruit délicieux qui a ses graines dehors",
        "8 fraises par repas",
        50,
        0,
        160,
        "strawberry.jpg"),
    new FruitsEtLegumes(8, "Framboise", "Pour Lionel",
        "10 framboises par repas", 70, 80, 160, "raspberry.jpg"),
    new FruitsEtLegumes(
        9,
        "Pomme",
        "Rouge ou verte, elles sont généralement rondes et délicieuses",
        " 1 pomme par repas",
        70,
        100,
        130,
        "apple.jpg"),
    new FruitsEtLegumes(
        10,
        "Tomates",
        "un fruit? Un légume? ... En tout cas c'est bon",
        "2 tomates par repas",
        70,
        80,
        160,
        "tomatoes.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
      child: (Platform.isIOS)
          ? CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: Theme.of(context).primaryColor,
                middle: CustomText(
                    text: widget.title,
                    fontColor: FontColor.white,
                    fontSize: FontSize.lg),
              ),
              child: body(),
            )
          : Scaffold(
              appBar: CustomAppbar(
                context: context,
                widthScreen: _screenWidth,
                heightScreen: _screenHeight,
              ),
              body: body(),
              bottomNavigationBar: CustomBottomBar(
                context: context,
                heightScreen: _screenHeight,
                widthScreen: _screenWidth,
              )),
    );
  }

  Widget body() {
    return Center(
      child: new GridView.builder(
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemCount: listeFetL.length,
          itemBuilder: (context, index) {
            return new Container(
              margin: EdgeInsets.all(15.0),
              child: new Card(
                elevation: 10.0,
                child: new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PageDetail(fruitAndLegumes: listeFetL[index]),
                      ),
                    );
                  },
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Card(
                        elevation: 10.0,
                        child: new Image.asset(
                          "fruits assets/${listeFetL[index].img}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      new Container(
                          child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                            new Text(
                              listeFetL[index].name,
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            new Text(
                              listeFetL[index].shortDescription,
                              textAlign: TextAlign.center,
                            )
                          ])),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
