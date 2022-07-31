import 'package:flutter/material.dart';

class SizeConfig {
  MediaQueryData? _mediaQueryData;
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  double? defaultSize;
  Orientation? orientation;

  SizeConfig(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(context, double inputHeight) {
  double screenHeight = SizeConfig(context).screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(context, double inputWidth) {
  double screenWidth = SizeConfig(context).screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
