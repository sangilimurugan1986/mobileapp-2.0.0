import 'dart:convert';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

List dataList = [
  {
    "name": "My Inbox",
    "id": 1,
    "subMenu": [
/*      {"id": ".01_ibx", "name": "Inbox (0)", "counts": 0, "icon": MdiIcons.mail},
      {"id": ".01_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
      {"id": ".01_str", "name": "Started (0)", "counts": 0, "icon": MdiIcons.box},
      {"id": ".01_cmp", "name": "Completed (0)", "counts": 0, "icon": MdiIcons.cube}*/
    ]
  },
  {
    "name": "See All Inbox",
    "id": 2,
    "subMenu": [
/*      {
        "name": "SIGNODE Production3",
        "id": "1",
        "subMenu": [
          {"id": "1_ibx", "name": "Inbox (2)", "counts": 1, "icon": MdiIcons.mail},
          {"id": "1_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
          {"id": "1_str", "name": "Started (0)", "counts": 0, "icon": MdiIcons.box},
          {"id": "1_cmp", "name": "Completed (5)", "counts": 8, "icon": MdiIcons.cube}
        ]
      },
      {
        "name": "Cost Optimization",
        "id": "2",
        "subMenu": [
          {"id": "2_ibx", "name": "Inbox (0)", "counts": 0, "icon": MdiIcons.mail},
          {"id": "2_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
          {"id": "2_str", "name": "Started (3)", "counts": 0, "icon": MdiIcons.box},
          {"id": "2_com", "name": "Completed (0)", "counts": 0, "icon": MdiIcons.cube}
        ]
      },
      {
        "name": "SIGNODE Production3",
        "id": "3",
        "subMenu": [
          {"id": "3_ibx", "name": "Inbox (2)", "counts": 1, "icon": MdiIcons.mail},
          {"id": "3_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
          {"id": "3_str", "name": "Started (0)", "counts": 0, "icon": MdiIcons.box},
          {"id": "3_cmp", "name": "Completed (5)", "counts": 8, "icon": MdiIcons.cube}
        ]
      },
      {
        "name": "Cost Optimization",
        "id": "4",
        "subMenu": [
          {"id": "4_ibx", "name": "Inbox (0)", "counts": 0, "icon": MdiIcons.mail},
          {"id": "4_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
          {"id": "4_str", "name": "Started (3)", "counts": 0, "icon": MdiIcons.box},
          {"id": "4_cmp", "name": "Completed (0)", "counts": 0, "icon": MdiIcons.cube}
        ]
      },
      {
        "name": "SIGNODE Production3",
        "id": "5",
        "subMenu": [
          {"id": "5_ibx", "name": "Inbox (2)", "counts": 1, "icon": MdiIcons.mail},
          {"id": "5_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
          {"id": "5_str", "name": "Started (0)", "counts": 0, "icon": MdiIcons.box},
          {"id": "5_cmp", "name": "Completed (5)", "counts": 8, "icon": MdiIcons.cube}
        ]
      },
      {
        "name": "Cost Optimization",
        "id": "6",
        "subMenu": [
          {"id": "6_ibx", "name": "Inbox (0)", "counts": 0, "icon": MdiIcons.mail},
          {"id": "6_snt", "name": "Sent (0)", "counts": 0, "icon": MdiIcons.arrangeSendToBack},
          {"id": "6_str", "name": "Started (3)", "counts": 0, "icon": MdiIcons.box},
          {"id": "6_cmp", "name": "Completed (0)", "counts": 0, "icon": MdiIcons.cube}
        ]
      }*/
    ]
  }
];

class MenuInbox {
  String name = '';
  String id = '';
  String wFormId = '';
  String repositoryId = '';
  dynamic flowJson = '';
  String initiatedBy = '';

  List<MenuInbox> subMenu = [];
  MenuInbox(
      {required this.name,
      required this.subMenu,
      required this.id,
      required this.flowJson,
      required this.wFormId,
      required this.repositoryId,
      required this.initiatedBy});

  MenuInbox.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'].toString();
    wFormId = NullAware(json['wFormId']);
    flowJson = NullAwareFJ(json['flowJson']);
    initiatedBy = NullAware(json['initiatedBy']);

    subMenu?.add(MenuInbox(
        id: json['id'].toString() + '_0',
        name: 'Inbox (' + json['inboxCount'].toString() + ')',
        wFormId: NullAware(json['wFormId']),
        repositoryId: NullAware(json['repositoryId']),
        flowJson: NullAwareFJ(json['flowJson']),
        initiatedBy: NullAware(json['initiatedBy']),
        subMenu: []));
    subMenu?.add(MenuInbox(
        id: json['id'].toString() + '_1',
        name: 'Sent(' + json['processCount'].toString() + ')',
        wFormId: NullAware(json['wFormId']),
        repositoryId: NullAware(json['repositoryId']),
        flowJson: NullAwareFJ(json['flowJson']),
        initiatedBy: NullAware(json['initiatedBy']),
        subMenu: []));
    subMenu?.add(MenuInbox(
        id: json['id'].toString() + '_2',
        name: 'Stared (0)',
        wFormId: NullAware(json['wFormId']),
        repositoryId: NullAware(json['repositoryId']),
        flowJson: NullAwareFJ(json['flowJson']),
        initiatedBy: NullAware(json['initiatedBy']),
        subMenu: []));
    subMenu?.add(MenuInbox(
        id: json['id'].toString() + '_3',
        name: 'Completed (' + json['completedCount'].toString() + ')',
        wFormId: NullAware(json['wFormId']),
        repositoryId: NullAware(json['repositoryId']),
        flowJson: NullAwareFJ(json['flowJson']),
        initiatedBy: NullAware(json['initiatedBy']),
        subMenu: []));
  }

  String NullAware(var vtemp) {
    if (vtemp == null)
      return '';
    else
      return jsonEncode(vtemp).toString();
  }

  dynamic NullAwareFJ(var vtemp) {
    if (vtemp == null)
      return '';
    else
      return jsonEncode(vtemp);
  }
}
