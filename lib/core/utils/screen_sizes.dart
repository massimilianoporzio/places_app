import 'package:flutter/material.dart';

enum ScreenSize {
  small,
  medium,
  large;
}

const _breakPoint1 = 600.0;
const _breakPoint2 = 840.0;

ScreenSize getScreenSize(double width) {
  debugPrint('size.width = $width');
  if (width < _breakPoint1) {
    return ScreenSize.small;
  } else if (width >= _breakPoint1 && width < _breakPoint2) {
    return ScreenSize.medium;
  }
  return ScreenSize.large;
}
