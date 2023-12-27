import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../utils/InboxDetails.dart';

class TaskMainController extends GetxController {
  final isLoading = false.obs;
  final error = ''.obs;
  //late RxList<InboxDetails> idSelected;
  static int iSelectedIndex = 0;

  List<Map<String, dynamic>> folderDatas = [
    {
      'Foldername': 'My Tasks',
      'details': {
        'Buttons': 'ReOpen,Low',
        'task owner': 'thanaselve@ezofis.com',
        'task assign': '[sangili@ezofis.com,raja@ezofis.com,raja2@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-03-22'
      }
    },
    {
      'Foldername': 'Signoid0',
      'details': {
        'Buttons': 'Open,Medium',
        'task owner': 'raja@gmail.com',
        'task assign': '[arun@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-05-02'
      }
    },
    {
      'Foldername': 'Signoid1',
      'details': {
        'Buttons': 'Open,Medium',
        'task owner': 'raja@gmail.com',
        'task assign': '[arun@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-05-02'
      }
    },
    {
      'Foldername': 'Signoid2',
      'details': {
        'Buttons': 'Open,Medium',
        'task owner': 'raja@gmail.com',
        'task assign': '[arun@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-05-02'
      }
    }
  ];

  List<Map<String, dynamic>> InboxDataewew = [
    {
      'details': {
        'Reques No': 'SN - 10',
        'Stage': 'Production Entry',
        'Rised At': '10-03-2023',
        'Rised BY': 'thanaselve@ezofis.com',
        'Last Action': 'Product Entry'
      }
    },
    {
      'details': {
        'Reques No': 'SN - 11',
        'Stage': 'Production ',
        'Rised At': '10-06-2023',
        'Rised BY': 'raja@ezofis.com',
        'Last Action': 'Product Entry'
      }
    }
  ];

  List<Map<String, dynamic>> InboxDataNew = [
    {
      'requestNo': 'SN - 10',
      'stage': 'Production Entry',
      'raisedAt': '2023-07-27T04:36:58.58Z',
      'raisedBy': 'thanaselve@ezofis.com',
      'lastAction': 'Product Entry',
      'read': true
    },
    {
      'requestNo': 'SN - 116',
      'stage': 'Production ',
      'raisedAt': '2023-07-27T06:36:58.58Z',
      'raisedBy': 'raja@ezofis.com',
      'lastAction': 'Product Entrys',
      'read': false
    },
    {
      'requestNo': 'SN - 10',
      'stage': 'Production Entry',
      'raisedAt': '2023-07-20T14:36:58.58Z',
      'raisedBy': 'thanaselve@ezofis.com',
      'lastAction': 'Product Entry',
      'read': true
    },
    {
      'requestNo': 'SN - 11',
      'stage': 'Production ',
      'raisedAt': '2022-05-30T14:36:58.58Z',
      'raisedBy': 'raja@ezofis.com',
      'lastAction': 'Product Entrys',
      'read': true
    },
    {
      'requestNo': 'SN - 10',
      'stage': 'Production Entry',
      'raisedAt': '2021-05-30T14:36:58.58Z',
      'raisedBy': 'thanaselve@ezofis.com',
      'lastAction': 'Product Entry',
      'read': false
    },
    {
      'requestNo': 'SN - 11',
      'stage': 'Production ',
      'raisedAt': '2023-05-30T12:36:58.58Z',
      'raisedBy': 'raja@ezofis.com',
      'lastAction': 'Product Entrys',
      'read': false
    },
    {
      'requestNo': 'SN - 10',
      'stage': 'Production Entry',
      'raisedAt': '2023-07-27T04:36:58.58Z',
      'raisedBy': 'thanaselve@ezofis.com',
      'lastAction': 'Product Entry',
      'read': true
    },
    {
      'requestNo': 'SN - 116',
      'stage': 'Production ',
      'raisedAt': '2023-07-27T06:36:58.58Z',
      'raisedBy': 'raja@ezofis.com',
      'lastAction': 'Product Entrys',
      'read': true
    },
    {
      'requestNo': 'SN - 10',
      'stage': 'Production Entry',
      'raisedAt': '2023-07-20T14:36:58.58Z',
      'raisedBy': 'thanaselve@ezofis.com',
      'lastAction': 'Product Entry',
      'read': true
    },
    {
      'requestNo': 'SN - 11',
      'stage': 'Production ',
      'raisedAt': '2022-05-30T14:36:58.58Z',
      'raisedBy': 'raja@ezofis.com',
      'lastAction': 'Product Entrys',
      'read': false
    },
    {
      'requestNo': 'SN - 10',
      'stage': 'Production Entry',
      'raisedAt': '2021-05-30T14:36:58.58Z',
      'raisedBy': 'thanaselve@ezofis.com',
      'lastAction': 'Product Entry',
      'read': true
    },
    {
      'requestNo': 'SN - 116',
      'stage': 'Production ',
      'raisedAt': '2023-05-30T12:36:58.58Z',
      'raisedBy': 'raja@ezofis.com',
      'lastAction': 'Product Entrys',
      'read': false
    }
  ];

  String dispDate(String sDate) {
    return '';
  }

  void onFabPlus() {
    debugPrint('onFabPlus in Task');
  }
}
