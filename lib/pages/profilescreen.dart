import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/dashmaincontroller.dart';
import '../layouts/search/SearchLayout.dart';

class ProfileScreen extends GetView<DashMainController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //return SearchLayout(children: [const SizedBox(height: 400)]);
    return SearchLayout(children: []);
  }
}
