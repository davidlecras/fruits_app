import 'package:flutter/material.dart';
import 'package:fruitsapp/widgets/btmAppBar.dart';
import 'package:fruitsapp/widgets/customAppbar.dart';

class Search extends StatefulWidget {
  
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double _screenWidth;
  double _screenHeight;
  bool _inputIsValid = true;
  String _recherche;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppbar(
        context: context,
        heightScreen: _screenHeight,
        widthScreen: _screenWidth,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(15.0)),
          Container(
            width: _screenWidth * 0.90,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Rechercher",
                errorText:
                    _inputIsValid ? null : "Veuillez indiquer une valeur",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              onChanged: (value) {
                print(value);
              },
              onSubmitted: (value) {
                print(value);
                _recherche = value;
                // if(_recherche.compareTo(legume[index].name) == 0){
                //   return card.of(legume[index] with all infos);
                // }
              },
            ),
          )
        ],
      )),
      bottomNavigationBar: CustomBottomBar(
        context: context,
        heightScreen: _screenHeight,
        widthScreen: _screenWidth,
      ),
    );
  }
}
