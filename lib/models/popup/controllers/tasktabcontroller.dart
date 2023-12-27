import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/fields.dart';

class TaskTabController extends GetxController {
  final tabitems = ['Home', 'Attachemnts', 'Comments', 'Task', 'History'];
  final fieldkeys = [
    'e_NFnW0JxrLpZxqPeJS7K',
    'pM6Vly-JRlfroRrziE1jr',
    'UXAsxouh5oubsW6_74Ldq',
    'Vf5RKsW-vYZVf_hOsdb3I',
    'OiEECeSQCDLtPaSuOiX0x',
    '11m7YRT-7kdLx-g6iGojc'
  ];
  final fieldkeysOrg = [
    'Foldername',
    'Assign to',
    'start date',
    'end date',
    'Buttons'
  ];

  List<Map<String, dynamic>> folderDatas = [
    {
      'Foldername': 'Test task',
      'details': {
        'Assign to': '[]',
        'start date': '2023-08-10',
        'end date': '2023-08-10',
        'Buttons': 'Open,Medium'
      }
    }
  ];
/*  List<Map<String, dynamic>> folderDatas = [
    {
      'Foldername': 'CC-TASK2',
      'details': {
        'Assign to': '[sangili@ezofis.com,raja@ezofis.com,raja2@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-03-22',
        'Buttons': 'ReOpen,Low'
      }
    },
    {
      'Foldername': 'CC-TASK3',
      'details': {
        'Assign to': '[arun@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-05-02',
        'Buttons': 'Open,Medium'
      }
    },
    {
      'Foldername': 'CC-TASK6',
      'details': {
        'Assign to': '[arun@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-05-02',
        'Buttons': 'Open,Medium'
      }
    },
    {
      'Foldername': 'CC-TASK7',
      'details': {
        'Assign to': '[arun@ezofis.com]',
        'start date': '2023-03-02',
        'end date': '2023-05-02',
        'Buttons': 'Open,Medium'
      }
    }
  ];*/
  List dataFileList = [
    {
      "name": "dev.pdf",
      "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
      "Status": "FAILED",
      "selected": false
    },
    {
      "name": "123.pdf",
      "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
      "Status": "INDEXED",
      "selected": false
    },
    {
      "name": "123.pdf",
      "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
      "Status": "PARTIALLY_INDEXED ",
      "selected": false
    }
  ];
}

class commentsdatas {
  String message;
  bool selected;
  commentsdatas(this.message, this.selected);
}
