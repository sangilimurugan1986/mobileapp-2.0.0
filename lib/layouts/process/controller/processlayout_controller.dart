import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/AlertDialogScreen.dart';
import '../models/menu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/menuheading.dart';

class ProcesslayoutController extends GetxController {
  // GlobalKey<ScaffoldState> _scaffoldKeyvalue = new GlobalKey<ScaffoldState>();
  var activeRoute = '/browse'.obs;

  final menus = [
    // MenuHeading(label: 'one'),
    Menu(
      label: 'Edit Profiles',
      icon: MdiIcons.squareEditOutline,
      activeIcon: MdiIcons.squareEditOutline,
      route: '/editprofile',
    ),
    Menu(
      label: 'E-mail',
      icon: MdiIcons.emailOutline,
      activeIcon: MdiIcons.emailOutline,
      route: '/email',
    ),
    Menu(
      label: 'Password',
      icon: MdiIcons.lockOutline,
      activeIcon: MdiIcons.lockOutline,
      route: '/password',
    ),
    MenuHeading(label: 'two'),
    Menu(
      label: 'Notification',
      icon: MdiIcons.bellAlert,
      activeIcon: MdiIcons.bellAlert,
      route: '/editprofile',
    ),
    Menu(
      label: 'Language',
      icon: MdiIcons.signLanguage,
      activeIcon: MdiIcons.signLanguage,
      route: '/email',
    ),
    Menu(
      label: 'Shortcut',
      icon: MdiIcons.lockOutline,
      activeIcon: MdiIcons.lockOutline,
      route: '/password',
    ),
    Menu(
      label: 'Theme',
      icon: MdiIcons.themeLightDark,
      activeIcon: MdiIcons.themeLightDark,
      route: '/password',
    ),
    MenuHeading(label: 'Three'),
    Menu(
      label: 'Help & Support',
      icon: MdiIcons.help,
      activeIcon: MdiIcons.help,
      route: '/editprofile',
    ),
    Menu(
      label: 'Logout',
      icon: MdiIcons.logout,
      activeIcon: MdiIcons.logout,
      route: '/email',
    )
  ].obs;

  void fabProcess() {
    debugPrint('Pressed FAB');
  }

  void goto(String route) {
    Get.toNamed(route);
  }

  void gototoast(String route, String sMsg, BuildContext ctx) {
    //22 55 14 16
    toggleDrawers(ctx);

    switch (route) {
      case '/logout':
        showAlertDialog(ctx, 'Do You Want to Logout?');
        break;
      case '/otpscreen':
        Get.offAllNamed('/otpscreen');
        break;
      default:
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          content: Text(sMsg + ' is Selected'),
        ));
        break;
    }
  }

  void toggleDrawers(BuildContext context) {
    if (!Scaffold.of(context).isDrawerOpen)
      Scaffold.of(context).openDrawer();
    else
      Scaffold.of(context).closeDrawer();
  }

  showAlertDialog(BuildContext context, String sMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert!'),
            content: Text(sMsg),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.cyan),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('No')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.purple),
                  onPressed: () {
                    Navigator.pop(context);
                    logout();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Logout Sucessfully.'),
                    ));
                  },
                  child: const Text(
                    'Yes',
                  )),
            ],
          );
        });
  }

  Future<void> logout() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    pre.clear();
    pre.commit();

    Get.offAllNamed("/loginscreen");
  }
}
