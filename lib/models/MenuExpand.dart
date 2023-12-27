import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/*List dataList = [
  {
    "name": "Sales",
    "icon": Icons.payment,
    "subMenu": [
      {"name": "Orders"},
      {"name": "Invoices"}
    ]
  },
  {
    "name": "Marketing",
    "icon": Icons.volume_up,
    "subMenu": [
      {
        "name": "Promotions",
        "subMenu": [
          {"name": "Catalog Price Rule"},
          {"name": "Cart Price Rules"}
        ]
      },
      {
        "name": "Communications",
        "subMenu": [
          {"name": "Newsletter Subscribers"}
        ]
      },
      {
        "name": "SEO & Search",
        "subMenu": [
          {"name": "Search Terms"},
          {"name": "Search Synonyms"}
        ]
      },
      {
        "name": "User Content",
        "subMenu": [
          {"name": "All Reviews"},
          {"name": "Pending Reviews"}
        ]
      }
    ]
  }
];*/
List dataList = [
  {
    "name": "Indexing",
    "subMenu": [
      {
        "name": "dev.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "FAILED"
      },
      {
        "name": "123.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "INDEXED"
      },
      {
        "name": "123.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "PARTIALLY_INDEXED "
      }
    ]
  },
  {
    "name": "Auto Processing",
    "subMenu": [
      {
        "name": "dev auto.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "FAILED"
      },
      {
        "name": "123 auto.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "Indexed"
      }
    ]
  },
  {
    "name": "Exporting ff",
    "subMenu": [
      {
        "name": "dev e.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "FAILED"
      },
      {
        "name": "123.pdf",
        "description": "Inversments \u2022 DATE \u2022 E-mail \u2022 ",
        "Status": "FAILED"
      }
    ]
  }
];

class MenuExpand {
  String name = '';
  List<MenuExpand> subMenu = [];

  MenuExpand({
    required this.name,
    required this.subMenu,
  });

  MenuExpand.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    if (json['subMenu'] != null) {
      subMenu.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new MenuExpand.fromJson(v));
      });
    }
  }
}
