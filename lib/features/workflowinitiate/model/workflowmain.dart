import 'package:ez/features/workflowinitiate/model/Controllist.dart';

class workflowmain {
  List<Controllist>? controllist;
  String? createdAt;
  String? createdBy;
  String? description;
  int? entryCount;
  String? error;
  String? formJson;
  String? formTable;
  int? id;
  bool? isDeleted;
  int? isEdit;
  String? layout;
  String? modifiedAt;
  String? modifiedBy;
  String? name;
  String? publishOption;
  int? repositoryId;
  int? tenantId;
  String? type;

  workflowmain(
      {this.controllist,
      this.createdAt,
      this.createdBy,
      this.description,
      this.entryCount,
      this.error,
      this.formJson,
      this.formTable,
      this.id,
      this.isDeleted,
      this.isEdit,
      this.layout,
      this.modifiedAt,
      this.modifiedBy,
      this.name,
      this.publishOption,
      this.repositoryId,
      this.tenantId,
      this.type});

  factory workflowmain.fromJson(Map<String, dynamic> json) {
    return workflowmain(
      controllist: json['controllist'] != null
          ? (json['controllist'] as List)
              .map((i) => Controllist.fromJson(i))
              .toList()
          : null,
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
      description: json['description'],
      entryCount: json['entryCount'],
      error: json['error'],
      formJson: json['formJson'],
      formTable: json['formTable'],
      id: json['id'],
      isDeleted: json['isDeleted'],
      isEdit: json['isEdit'],
      layout: json['layout'],
      modifiedAt: json['modifiedAt'],
      modifiedBy: json['modifiedBy'],
      name: json['name'],
      publishOption: json['publishOption'],
      repositoryId: json['repositoryId'],
      tenantId: json['tenantId'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['description'] = this.description;
    data['entryCount'] = this.entryCount;
    data['error'] = this.error;
    data['formJson'] = this.formJson;
    data['formTable'] = this.formTable;
    data['id'] = this.id;
    data['isDeleted'] = this.isDeleted;
    data['isEdit'] = this.isEdit;
    data['layout'] = this.layout;
    data['modifiedAt'] = this.modifiedAt;
    data['modifiedBy'] = this.modifiedBy;
    data['name'] = this.name;
    data['publishOption'] = this.publishOption;
    data['repositoryId'] = this.repositoryId;
    data['tenantId'] = this.tenantId;
    data['type'] = this.type;
    if (this.controllist != null) {
      data['controllist'] = this.controllist?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
