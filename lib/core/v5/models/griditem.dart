import 'package:json_annotation/json_annotation.dart';

import 'language.dart';

@JsonSerializable(explicitToJson: true)
class GridItems {
  final int griditemid;
  final String sName;
  final String sDescription;
  final int iRepositories;
  final int iWorflow;
  final int iPortals;
  final int iTask;

  GridItems(
      {required this.griditemid,
      required this.sDescription,
      required this.sName,
      required this.iRepositories,
      required this.iWorflow,
      required this.iPortals,
      required this.iTask});

/*  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);*/
}
