import 'package:ez/controllers/auth_controller.dart';
import 'package:ez/controllers/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../controllers/topbar_controller.dart'; //357
import '../../../widgets/text_input_searchable.dart';
import '../controller/searchlayout_controller.dart';
import 'ExampleSearchBar.dart';

class TopBarDesign extends StatelessWidget implements PreferredSizeWidget {
  var tabbarController = TopBarController();
  SearchlayoutController controller = SearchlayoutController();
  //SessionController sessionController = SessionController();
  //final sessionCtrl = Get.put(SessionController());
  final authcontroller = Get.put(AuthController());

  final double height;

  TopBarDesign({
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
/*    print(authcontroller.userdata);
    print('uuu1 ' + authcontroller.userdata['avatar'].toString().length.toString());
    print(ModalRoute.of(context)?.settings.name);*/

    return Container(
        color: Color.fromRGBO(0, 191, 255, 1), //00bfff
        height: double.infinity,
        child: Row(children: [
          Align(
              alignment: Alignment.centerLeft,
              //alignment: Alignment.topLeft,
              child: Container(
                  // color: Colors.red,
                  height: double.infinity,
                  //margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                  constraints: BoxConstraints(
                      maxWidth: 60.0, minWidth: 60.0, maxHeight: 50.0, minHeight: 50.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
                      child: Container(
                          color: Colors.purple,
                          padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                          child: ImageIcon(
                            AssetImage('assets/images/logo/ezofis/mark.png'),
                            color: Colors.white,
                          ))))),
          Expanded(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    alignment: Alignment.center,
                    height: double.infinity,
                    //padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    // height: double.infinity,
                    child: Row(children: [
                      Container(
                          //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: authcontroller.userdata['avatar'].toString().length < 15
                              ? CircleAvatar(
                                  radius: 25, //radius is 50
                                  backgroundImage:
                                      AssetImage('assets/images/background/useravaathar.png'),
                                  //image url
                                )
                              : CircleAvatar(
                                  radius: 25, //radius is 50
                                  backgroundImage: NetworkImage(
                                      // NetworkImage(authcontroller.userdata['avathar']),
                                      authcontroller.userdata['avatar'].toString()), //image url
                                )),
                      Container(
                          //color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: RawMaterialButton(
                            elevation: 6,
                            padding: EdgeInsets.all(2),
                            onPressed: () {},
                            // elevation: 2.0,
                            fillColor: Color(0xFFF5F6F9),
                            child: Icon(
                              MdiIcons.bellOutline,
                              color: Colors.purple,
                            ),
                            //  padding: EdgeInsets.all(1.0),
                            shape: CircleBorder(),
                          )),
                    ]))),
          ),
        ]));
  }
}
