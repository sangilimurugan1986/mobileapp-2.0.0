import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../core/v5/utils/helper/safe_area.dart';

class SafeContainer extends StatelessWidget {
  const SafeContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final safeArea = calcSafeArea();

    final safeAreaHeight = safeArea['height'];
    final safeAreaWidth = safeArea['width'];

    return Container(
      // padding: const EdgeInsets.all(24),
      height: safeAreaHeight,
      width: safeAreaWidth,
      //child: child,

      child: MediaQuery(
        child: child,
        data: MediaQuery.of(context).copyWith(textScaleFactor: .80),
      ),
    );
  }
}
