import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TaskController extends GetxController {
  final iCurrentSelect = ''.obs;
  final iSelected = 0.obs;

  void fnConnect(String sSelected) {
    debugPrint('tabfunction1' + sSelected);
    iCurrentSelect.value = sSelected;
  }

  void fnBrowsedd(String sSelected) {
    debugPrint('tabfunction1' + sSelected);
    iCurrentSelect.value = sSelected;
  }

  void fnExplrer(String sSelected) {
    debugPrint('tabfunction1' + sSelected);
    iCurrentSelect.value = sSelected;
  }

  tabFunction(String sSelected) {
    debugPrint('tabfunction44 ' + sSelected);
    iCurrentSelect.value = sSelected;
    debugPrint('tabfunction2s===1' + sSelected.toString());
    debugPrint('tabfunction2e===2' + iCurrentSelect.value.toString());

    setState(() {
      debugPrint('setState tabfunction44 ' + sSelected);
      iCurrentSelect.value = sSelected;
      debugPrint('setState tabfunction44 ' + iCurrentSelect.value);
    });

/*    switch (sSelected) {
      case 'Connect':
        Get.offAllNamed('/home');
        break;
      case 'Browse':
        Get.offAllNamed('/task');
        break;
      case 'Explore':
        Get.offAllNamed('/folder');
        break;
    }*/
  }

  void setState(Null Function() param0) {}
}
