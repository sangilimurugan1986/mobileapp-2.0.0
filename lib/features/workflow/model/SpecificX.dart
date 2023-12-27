import 'package:ez/features/workflow/model/AutoGenerateValue.dart';
import 'package:ez/features/workflow/model/MatrixColumnX.dart';
import 'package:ez/features/workflow/model/MatrixRowX.dart';
import 'package:ez/features/workflow/model/MatrixTypeSettingsX.dart';
import 'package:ez/features/workflow/model/NestedListTypeSettingsX.dart';
import 'package:ez/features/workflow/model/NestedX.dart';
import 'package:ez/features/workflow/model/TabX.dart';
import 'package:ez/features/workflow/model/TableColumn.dart';

class SpecificX {
  List<String>? additionalLoginTypes;
  bool? allowHalfRating;
  bool? allowMultipleFiles;
  bool? allowMultipleSignatures;
  bool? allowToAddNewOptions;
  AutoGenerateValue? autoGenerateValue;
  // String? customDefaultValue;
  String? customOptions;
  String? defaultValue;
  List<Object>? fibFields;
  String? formula;
  String? loginType;
  String? mappedColumnId;
  String? mappedFieldId;
  String? masterTable;
  String? masterTableColumn;
  List<MatrixColumnX>? matrixColumns;
  List<MatrixRowX>? matrixRows;
  String? matrixType;
  MatrixTypeSettingsX? matrixTypeSettings;
  List<NestedX>? nestedList;
  String? nestedListFieldType;
  List<Object>? nestedListItemsPerLine;
  int? nestedListMaxLevel;
  NestedListTypeSettingsX? nestedListTypeSettings;
  int? optionsPerLine;
  String? optionsType;
  String? popupTriggerType;
  bool? qrValue;
  String? ratingIcon;
  int? ratingIconCount;
  String? secondaryPanel;
  String? separateOptionsUsing;
  bool? showColumnTotal;
  List<TabX>? tabList;
  List<Object>? tableColumns;
  int? tableFixedRowCount;
  List<Object>? tableFixedRowLabels;
  String? tableRowsType;
  String? textContent;

  SpecificX(
      {this.additionalLoginTypes,
      this.allowHalfRating,
      this.allowMultipleFiles,
      this.allowMultipleSignatures,
      this.allowToAddNewOptions,
      this.autoGenerateValue,
      // this.customDefaultValue,
      this.customOptions,
      this.defaultValue,
      this.fibFields,
      this.formula,
      this.loginType,
      this.mappedColumnId,
      this.mappedFieldId,
      this.masterTable,
      this.masterTableColumn,
      this.matrixColumns,
      this.matrixRows,
      this.matrixType,
      this.matrixTypeSettings,
      this.nestedList,
      this.nestedListFieldType,
      this.nestedListItemsPerLine,
      this.nestedListMaxLevel,
      this.nestedListTypeSettings,
      this.optionsPerLine,
      this.optionsType,
      this.popupTriggerType,
      this.qrValue,
      this.ratingIcon,
      this.ratingIconCount,
      this.secondaryPanel,
      this.separateOptionsUsing,
      this.showColumnTotal,
      this.tabList,
      this.tableColumns,
      this.tableFixedRowCount,
      this.tableFixedRowLabels,
      this.tableRowsType,
      this.textContent});

  factory SpecificX.fromJson(Map<String, dynamic> json) {
    return SpecificX(
      additionalLoginTypes: json['additionalLoginTypes'] != null
          ? new List<String>.from(json['additionalLoginTypes'])
          : null,
      allowHalfRating: json['allowHalfRating'],
      allowMultipleFiles: json['allowMultipleFiles'],
      allowMultipleSignatures: json['allowMultipleSignatures'],
      allowToAddNewOptions: json['allowToAddNewOptions'],
      autoGenerateValue: json['autoGenerateValue'] != null
          ? AutoGenerateValue.fromJson(json['autoGenerateValue'])
          : null,
      // customDefaultValue: json['customDefaultValue'],
      customOptions: json['customOptions'],
      defaultValue: json['defaultValue'],
      fibFields: json['fibFields'] != null
          ? (json['fibFields'] as List)
              .map((i) => TableColumn.fromJson(i))
              .toList()
          : null,
      formula: json['formula'],
      loginType: json['loginType'],
      mappedColumnId: json['mappedColumnId'],
      mappedFieldId: json['mappedFieldId'],
      masterTable: json['masterTable'],
      masterTableColumn: json['masterTableColumn'],
      matrixColumns: json['matrixColumns'] != null
          ? (json['matrixColumns'] as List)
              .map((i) => MatrixColumnX.fromJson(i))
              .toList()
          : null,
      matrixRows: json['matrixRows'] != null
          ? (json['matrixRows'] as List)
              .map((i) => MatrixRowX.fromJson(i))
              .toList()
          : null,
      matrixType: json['matrixType'],
      matrixTypeSettings: json['matrixTypeSettings'] != null
          ? MatrixTypeSettingsX.fromJson(json['matrixTypeSettings'])
          : null,
      nestedList: json['nestedList'] != null
          ? (json['nestedList'] as List)
              .map((i) => NestedX.fromJson(i))
              .toList()
          : null,
      nestedListFieldType: json['nestedListFieldType'],
      nestedListItemsPerLine: [],
      nestedListMaxLevel: json['nestedListMaxLevel'],
      nestedListTypeSettings: json['nestedListTypeSettings'] != null
          ? NestedListTypeSettingsX.fromJson(json['nestedListTypeSettings'])
          : null,
      optionsPerLine: json['optionsPerLine'],
      optionsType: json['optionsType'],
      popupTriggerType: json['popupTriggerType'],
      qrValue: json['qrValue'],
      ratingIcon: json['ratingIcon'],
      ratingIconCount: json['ratingIconCount'],
      secondaryPanel: json['secondaryPanel'],
      separateOptionsUsing: json['separateOptionsUsing'],
      showColumnTotal: json['showColumnTotal'],
      tabList: json['tabList'] != null
          ? (json['tabList'] as List).map((i) => TabX.fromJson(i)).toList()
          : null,
      tableColumns: json['tableColumns'] != null
          ? (json['tableColumns'] as List)
              .map((i) => TableColumn.fromJson(i))
              .toList()
          : null,
      tableFixedRowCount: json['tableFixedRowCount'],
      tableFixedRowLabels: [],
      tableRowsType: json['tableRowsType'],
      textContent: json['textContent'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allowHalfRating'] = this.allowHalfRating;
    data['allowMultipleFiles'] = this.allowMultipleFiles;
    data['allowMultipleSignatures'] = this.allowMultipleSignatures;
    data['allowToAddNewOptions'] = this.allowToAddNewOptions;
    // data['customDefaultValue'] = this.customDefaultValue;
    data['customOptions'] = this.customOptions;
    data['defaultValue'] = this.defaultValue;
    data['formula'] = this.formula;
    data['loginType'] = this.loginType;
    data['mappedColumnId'] = this.mappedColumnId;
    data['mappedFieldId'] = this.mappedFieldId;
    data['masterTable'] = this.masterTable;
    data['masterTableColumn'] = this.masterTableColumn;
    data['matrixType'] = this.matrixType;
    data['nestedListFieldType'] = this.nestedListFieldType;
    data['nestedListMaxLevel'] = this.nestedListMaxLevel;
    data['optionsPerLine'] = this.optionsPerLine;
    data['optionsType'] = this.optionsType;
    data['popupTriggerType'] = this.popupTriggerType;
    data['qrValue'] = this.qrValue;
    data['ratingIcon'] = this.ratingIcon;
    data['ratingIconCount'] = this.ratingIconCount;
    data['secondaryPanel'] = this.secondaryPanel;
    data['separateOptionsUsing'] = this.separateOptionsUsing;
    data['showColumnTotal'] = this.showColumnTotal;
    data['tableFixedRowCount'] = this.tableFixedRowCount;
    data['tableRowsType'] = this.tableRowsType;
    data['textContent'] = this.textContent;
    if (this.additionalLoginTypes != null) {
      data['additionalLoginTypes'] = this.additionalLoginTypes;
    }
    if (this.autoGenerateValue != null) {
      data['autoGenerateValue'] = this.autoGenerateValue?.toJson();
    }
    if (this.fibFields != null) {
      data['fibFields'] = [];
    }
    if (this.matrixColumns != null) {
      data['matrixColumns'] =
          this.matrixColumns?.map((v) => v.toJson()).toList();
    }
    if (this.matrixRows != null) {
      data['matrixRows'] = this.matrixRows?.map((v) => v.toJson()).toList();
    }
    if (this.matrixTypeSettings != null) {
      data['matrixTypeSettings'] = this.matrixTypeSettings?.toJson();
    }
    if (this.nestedList != null) {
      data['nestedList'] = this.nestedList?.map((v) => v.toJson()).toList();
    }
    if (this.nestedListItemsPerLine != null) {
      data['nestedListItemsPerLine'] = [];
    }
    if (this.nestedListTypeSettings != null) {
      data['nestedListTypeSettings'] = this.nestedListTypeSettings?.toJson();
    }
    if (this.tabList != null) {
      data['tabList'] = this.tabList?.map((v) => v.toJson()).toList();
    }
    if (this.tableColumns != null) {
      data['tableColumns'] = [];
    }
    if (this.tableFixedRowLabels != null) {
      data['tableFixedRowLabels'] = [];
    }
    return data;
  }
}
