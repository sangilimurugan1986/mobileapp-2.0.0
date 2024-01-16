import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../api/auth_repo.dart';
import '../utils/helper/aes_encryption.dart';

class DashMainController extends GetxController {
  RxString iCurrentSelect = 'dashboard'.obs;
  final iPendingtask = ''.obs;

  justPrint() {
    debugPrint('justPrint');
    debugPrint(AaaEncryption.KeyVal.toString());
    debugPrint(AaaEncryption.IvVal.toString());
    debugPrint(AaaEncryption.sToken);
  }

  void getTotalInboxCount() async {
    final responses = await AuthRepo.getTotalInboxCount();
    final ttemp = AaaEncryption.decryptAESaaa(responses.toString());

    if (int.parse(ttemp) > 0)
      iPendingtask.value = ttemp;
    else
      iPendingtask.value = '0';
  }
}
