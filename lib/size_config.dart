import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth=0.0;
  static double screenHeight=0.0;
  static double blockSizeHorizontal=1.0;
  static double blockSizeVertical=1.0;
  static double _safeAreaHorizontal=0.0;
  static double _safeAreaVertical=0.0;
  static double safeBlockHorizontal=1.0;
  static double safeBlockVertical=1.0;

  void init(BuildContext context){
    MediaQueryData _mediaQueryData;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth/100;
    blockSizeVertical = screenHeight/100;
    _safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal)/100;
    safeBlockVertical = (screenHeight - _safeAreaVertical)/100;
  }
}