import 'dart:math';

import 'package:get/get.dart';

Map<String, double> calcSafeArea() {
  final size = Get.mediaQuery.size;
  final height = size.height;
  final width = size.width;

  final padding = Get.mediaQuery.padding;
  final paddingTop = padding.top;
  final paddingBottom = padding.bottom;

  final safeAreaPadding = paddingTop + paddingBottom;

  final safeAreaHeight = max(height, width) - safeAreaPadding;
  final safeAreaWidth = min(height, width);

  return {
    'height': safeAreaHeight,
    'width': safeAreaWidth,
  };
}
