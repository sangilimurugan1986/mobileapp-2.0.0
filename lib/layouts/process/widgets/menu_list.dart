import 'package:ez/layouts/process/controller/processlayout_controller.dart';

import 'package:flutter/material.dart';

import '../models/menuheading.dart';
import '../models/menu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'menu_tile.dart';
import 'menu_tile_title.dart';

class MenuList extends StatelessWidget {
  //final controller = Get.put(ProcesslayoutController());
  MenuList({Key? key}) : super(key: key);
  final controller = new ProcesslayoutController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, int i) {
        return Container(
          // color: Colors.yellow,
          child: Column(children: <Widget>[
            MenuTileTitle(label: 'Information', color: Colors.black),
            MenuTile(
              label: 'Edit Profiles',
              icon: MdiIcons.squareEditOutline,
              color: Colors.black,
              onTap: () => controller.gototoast('/editprofile', 'Edit Profile', context),
            ),
            MenuTile(
              label: 'E-mail',
              icon: MdiIcons.emailOutline,
              color: Colors.black,
              onTap: () => controller.gototoast('/email', 'E-Mail', context),
            ),
            MenuTile(
              label: 'Password',
              icon: MdiIcons.lockOutline,
              color: Colors.black,
/*              onTap: () =>
                  controller.gototoast('/password', 'Password', context),*/
              onTap: () => controller.gototoast('/otpscreen', 'Password', context),
            ),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            MenuTileTitle(label: 'Preferences', color: Colors.black),
            MenuTile(
              label: 'Notification',
              icon: MdiIcons.bellOutline,
              color: Colors.black,
              onTap: () => controller.gototoast('/notification', 'Notification', context),
            ),
            MenuTile(
              label: 'Language',
              icon: MdiIcons.web,
              color: Colors.black,
              onTap: () => controller.gototoast('/languages', 'Languages', context),
            ),
            MenuTile(
              label: 'Shortcut',
              icon: MdiIcons.pin,
              color: Colors.black,
              onTap: () => controller.gototoast('/shortcut', 'ShortCut', context),
            ),
            MenuTile(
              label: 'Theme',
              icon: MdiIcons.themeLightDark,
              color: Colors.black,
              onTap: () => controller.gototoast('/theme', 'Theme', context),
            ),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
            MenuTileTitle(label: 'Account', color: Colors.black),
            MenuTile(
              label: 'Help & Support',
              icon: MdiIcons.plus,
              color: Colors.black,
              onTap: () => controller.gototoast('/help', 'Help & Support', context),
            ),
            MenuTile(
              label: 'Logout',
              icon: MdiIcons.logout,
              color: Colors.black,
              onTap: () => {
                /*controller.gototoast('/logout', 'Logout', context)*/
                showAlert(context)
              },
            ),
            Divider(
              color: Colors.black12,
              thickness: 1,
            ),
          ]),
        ); /*MenuTile(
            label: 'menu.label',
            icon: controller.activeRoute.value == menu.ic
                ? menu.activeIcon
                : menu.icon,
            color: controller.activeRoute.value == menu.route
                ? BrandColors.secondary
                : Colors.white70,
            isActive: controller.activeRoute.value == menu.route,
            onTap: () => controller.goto(menu.route),
          ),*/
      },
    );
  }

  goto(String route) {}

  void showAlert(BuildContext context) {
    print('showalert.....');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert Dialog Box"),
        content: const Text("You have raised a Alert Dialog Box"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(14),
              child: const Text("ok"),
            ),
          ),
        ],
      ),
    );
    /* AlertDialog(
      title: Text(''),
      content: Text('botitledy'),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: CustomColors.green),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No')),
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: CustomColors.red),
            onPressed: () {},
            child: const Text(
              'Yes',
            )),
      ],
    );*/
  }

  final menus = [
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
  ];
}
