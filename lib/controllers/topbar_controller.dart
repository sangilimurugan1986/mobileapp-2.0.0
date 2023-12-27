import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBarController extends GetxController {
  var sProfileImage = ''.obs;
  var sSearchText = ''.obs;
  var bNavDrawerOpen = false.obs;
  var sName = ''.obs;
  var sEmail = ''.obs;
  final showDrawer = false.obs;

  TopBarController() {}

  void onSearchTextChanged(String value) {}
}
