import 'package:ez/controllers/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../controllers/topbar_controller.dart'; //357

import '../../test/widgets/text_input_searchable.dart';

class TopBarDesign extends StatefulWidget {
  const TopBarDesign();

  @override
  _TopBarDesignState createState() => _TopBarDesignState();
}

class _TopBarDesignState extends State<TopBarDesign> {
  @override
  void initState() {
    super.initState();
  }

//class TopBarDesign extends StatelessWidget {
  var tabbarController = TopBarController();
  //SearchlayoutController controller = SearchlayoutController();
  SessionController sessionController = SessionController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double dwidth = mediaQuery.size.width * .6;
    double dheight = mediaQuery.size.height * .08;
    return Container(
        color: Colors.cyanAccent,
        height: dheight,
        child: Stack(children: [
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
                    // height: .infinity,
                    child: Row(children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Obx(() => tabbarController.sProfileImage == ''
                              ? CircleAvatar(
                                  radius: 25, //radius is 50
                                  backgroundImage:
                                      AssetImage('assets/images/background/useravaathar.png'),
                                  //image url
                                )
                              : CircleAvatar(
                                  radius: 25, //radius is 50
                                  backgroundImage: NetworkImage(
                                      'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_170,w_170,f_auto,b_white,q_auto:eco,dpr_1/yzvorwwd042nwikbs0xb'), //image url
                                ))),
                      Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.all(5),
                          child: CircleAvatar(
                            child: Icon(
                              MdiIcons.bellOutline,
                              color: Colors.blueGrey,
                            ),
                            radius: 20,
                            backgroundColor: Colors.transparent,
                          )),
                      GestureDetector(
                        child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.all(5),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.search_outlined,
                                color: Colors.blueGrey,
                              ),
                              radius: 20,
                              backgroundColor: Colors.transparent,
                            )),
                        onTap: justPrint(),
                      ),
                      Container(
                          child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                  height: dheight,
                                  width: dwidth,
                                  child: TextInputSearchableSearch()))),
                    ]))),
          ),
        ]));
  }

  justPrint() {}
}
