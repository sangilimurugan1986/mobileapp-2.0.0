import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BrowseViewController extends GetxController {
  final isLoading = false.obs;
  final iCurrentSelect = 1.obs;

  // onInit
  @override
  void onInit() {
    super.onInit();
  }

  void tabFunction(int id) {
    iCurrentSelect.value = id;

    isLoading.value = true;
    switch (id) {
      case 1:
        Get.toNamed('/home');
        break;
      case 2:
        Get.toNamed('/task');
        break;
      case 3:
        Get.toNamed('/folder');
        break;
      case 4:
        Get.toNamed('/tasks');
        break;
      case 5:
        Get.toNamed('/web');
        break;
    }
    isLoading.value = false;
  }
}
