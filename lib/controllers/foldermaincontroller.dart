import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FolderMainController extends GetxController {
  final isLoading = false.obs;
  final error = ''.obs;
  List<Map<String, dynamic>> folderDatas = [
    {
      'Foldername': 'invesments',
      'Description': '-',
      'details': {
        'workspace': 'Finance',
        'type': 'Static',
        'files': 0,
        'size': '0MB'
      }
    },
    {
      'Foldername': 'invesments2',
      'Description': 'Description datas',
      'details': {
        'workspace': 'Suppplier Invoice',
        'type': 'Static',
        'files': 12,
        'size': '1234MB'
      }
    },
    {
      'Foldername': 'invesments3',
      'Description': 'Description datas',
      'details': {
        'workspace': 'Suppplier Invoice',
        'type': 'Static',
        'files': 12,
        'size': '1234MB'
      }
    }
  ];

  Future edit() async {
    debugPrint('Edit');
    isLoading.value = true;
  }

  Future delete() async {
    debugPrint('Delete');
    isLoading.value = true;
  }

  Future menudoticon() async {
    debugPrint('Verticle Dots');
    isLoading.value = true;
  }
}
