import 'package:challenge/searchBar.dart';
import 'package:challenge/size_config.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool visibility=true;
  var borderColor=Colors.transparent;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double safeBlockHorizontal = SizeConfig.safeBlockHorizontal;
    double safeBlockVertical = SizeConfig.safeBlockVertical;
    var borderWidth = safeBlockHorizontal * 2;
    final borderRadius = safeBlockHorizontal * 10;

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orangeAccent,
      ),
      child:MaterialButton(
        color: Colors.orangeAccent,
        child:Visibility(visible: visibility,child: Icon(Icons.search)),
        shape: CircleBorder(side: BorderSide(color:borderColor)),
        padding: EdgeInsets.all(safeBlockHorizontal*4),
        onPressed:(){
          setState((){
            visibility=false;
            borderColor=Colors.black;
          });
          Navigator.pushNamed(context,'/searchBar');
          },//SearchBar();
      ),
    );
  }
}
