import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TabIndexController extends GetxController {
  final iCurrentSelect = '1'.obs;
  final iCurrentSelectSize = '3'.obs;
  final ipageval = 1.obs;

  nextfn() {
    ipageval.value = ipageval.value + 1;
  }
}
