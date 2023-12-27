import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/browse_view_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'bottom_bar.dart';

class BrowseViewBottomBar extends StatelessWidget {
  BrowseViewBottomBar({Key? key}) : super(key: key);
  final controller = Get.find<BrowseViewController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomBar(
          action1: IconButton(
            tooltip: 'DashBoard',
            icon: Icon(MdiIcons.viewDashboard,
                color: controller.iCurrentSelect == 1
                    ? Colors.purple
                    : Colors.blueGrey),
            onPressed: () => controller.tabFunction(1),
          ),
          action2: IconButton(
            tooltip: 'Worksapace',
            icon: Icon(MdiIcons.briefcaseOutline,
                color: controller.iCurrentSelect == 2
                    ? Colors.purple
                    : Colors.blueGrey),
            onPressed: () => controller.tabFunction(2),
          ),
          action5: IconButton(
            tooltip: 'Folder',
            icon: Icon(MdiIcons.archiveOutline,
                color: controller.iCurrentSelect == 3
                    ? Colors.purple
                    : Colors.blueGrey),
            onPressed: () => controller.tabFunction(3),
          ),
          action3: IconButton(
              // 9578104403
              tooltip: 'Task',
              icon: Icon(MdiIcons.cubeOutline, //ellipsis
                  color: controller.iCurrentSelect == 4
                      ? Colors.purple
                      : Colors.blueGrey),
              onPressed: () => controller.tabFunction(4)),
          action4: IconButton(
            //223
            tooltip: 'Portals',
            icon: Icon(
              MdiIcons.web,
              color: controller.iCurrentSelect == 5
                  ? Colors.purple
                  : Colors.blueGrey,
            ),
            onPressed: () => controller.tabFunction(5),
          ),
        ));
  }
}
