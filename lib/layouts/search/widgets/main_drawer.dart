import 'package:ez/layouts/process/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../controllers/session_controller.dart';
import '../controller/searchlayout_controller.dart';
import 'menu_list.dart';
import 'menu_tile.dart';

class MainDrawer extends StatelessWidget {
  final sessionController = Get.find<SessionController>();
  SearchlayoutController controller = SearchlayoutController();

  MainDrawer({Key? key}) : super(key: key);
  final store = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70, //20.0,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 5, 5),
            child: IconButton(
              icon: Icon(
                MdiIcons.arrowLeft,
                color: Colors.black,
              ),
              onPressed: () {
                controller.toggleDrawers(context);
              },
            ),
          ),
          // user tile
          UserTile(), // ...

          const SizedBox(height: 10),
          Divider(
            color: Colors.black12,
            thickness: 1,
          ),
          // menu list
          Expanded(
            child: MenuList(),
          ),
/*            MenuTile(
              label: 'Logout',
              icon: Icons.power_settings_new,
              color: Colors.white70,
              onTap: sessionController.logOut,
            ),*/

          SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child: Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Version : 1.0',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ))),
          )
        ],
      ),
    );
  }
}
