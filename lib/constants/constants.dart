import 'package:flutter/material.dart';

double getResponsiveSize(BuildContext context, {required double size}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = scaleFactor * size;
  double lowerLimit = size * 0.8;
  double upperLimit = size * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double w = MediaQuery.of(context).size.width;
  if (w <= 550) {
    return w / 400; // Mobile breakpoint
  } else if (w <= 900) {
    return w / 700; // Tablet breakpoint
  } else {
    return w / 1000; // Desktop breakpoint
  }
}

class AssetImages {
  static String guessGreen = "assets/images/guess_green.svg";
  static String guessGrey = "assets/images/guess_grey.svg";
  static String guessYellow = "assets/images/guess_yellow.svg";
}
