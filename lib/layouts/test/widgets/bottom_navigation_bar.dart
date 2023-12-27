import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/browse_view_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bottom_bar.dart';

class BottomNavigationBar extends StatelessWidget {
  BottomNavigationBar({Key? key}) : super(key: key);

  final controller = Get.find<BrowseViewController>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar();
  }
}
