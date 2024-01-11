import 'package:ez/controllers/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../controllers/topbar_controller.dart'; //357
import '../../../widgets/text_input_searchable.dart';
import '../controller/processlayout_controller.dart';

class TopBarProfileDesign extends StatelessWidget
    implements PreferredSizeWidget {
  var tabbarController = TopBarController();
  ProcesslayoutController controller = ProcesslayoutController();
  SessionController sessionController = SessionController();

  final Widget child;
  final double height;

  TopBarProfileDesign({
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        child: Stack(children: <Widget>[
          Container(
              color: Colors.cyanAccent,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 42,
                      margin: EdgeInsets.all(20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints(
                                  minWidth: 40.0, minHeight: 36.0),
                              padding: EdgeInsets.all(8.0),
                              shape: CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.white,
                              child: Icon(
                                MdiIcons.menu,
                                color: Colors.purple,
                              ),
                              onPressed: () {
                                debugPrint('Top bar Menu Icons.');
                                controller.toggleDrawers(context);
                              },
                            ),
                            // SizedBox(width: 1),
                            TextInputSearchable(
                                title: "",
                                type: TextInputType.text,
                                onChange: tabbarController.onSearchTextChanged,
                                placeholder: "Search"),
                          ])))),
          Positioned(
              child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Container(
                      color: Colors.purple,
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: ImageIcon(
                        AssetImage('assets/images/logo/ezofis/mark.png'),
                        color: Colors.white,
                      ))),
            ],
          )),
          Positioned(
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 7, 0),
                    //color: Colors.red,
                    height: 42,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              debugPrint('Top Bar Notification Icon');
                            },
                            child: Center(
                                child: Icon(
                              MdiIcons.bell,
                              color: Colors.white,
                            )),
                            style: OutlinedButton.styleFrom(
                                shape: CircleBorder(),
                                shadowColor: Colors.white,
                                padding: EdgeInsets.all(1),
                                side:
                                    BorderSide(color: Colors.white, width: 2)),
                          ),
                          Obx(() => tabbarController.sProfileImage == ''
                              ? CircleAvatar(
                                  radius: 25, //radius is 50
                                  backgroundImage: AssetImage(
                                      'assets/images/background/useravaathar.png'),
                                  //image url
                                )
                              : CircleAvatar(
                                  radius: 25, //radius is 50
                                  backgroundImage: NetworkImage(
                                      'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/yzvorwwd042nwikbs0xb'), //image url
                                )),
                        ]))),
          ),
        ]));
  }
}
