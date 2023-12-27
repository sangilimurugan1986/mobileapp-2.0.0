import 'dart:convert';

import 'package:ez/models/popup/controllers/popupfullpagecontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../api/auth_repo.dart';
import '../../../utils/helper/aes_encryption.dart';
import '../../comments.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CommentController extends GetxController {
  //final controllerpopup = Get.put(PopupFullPageController());
  int iSelecteFileCount = 0;

  String sMessage = '';
  final formFieldsModel = <String, dynamic>{}.obs;
  String radioFields = 'Internal (Private),External (Public)';
  String Initial = 'Internal (Private)';
  dynamic showTo = 1;

  List dataMessageList = <commentsdatas>[];
  int getSelectedFileCount(List dataFileListNew) {
    var filtered = dataFileListNew.where((e) => e.selected == true);
    return filtered.length;
  }

  void onFormFieldChanged(dynamic value, String fieldName) {
    formFieldsModel[fieldName] = value;
  }
}
