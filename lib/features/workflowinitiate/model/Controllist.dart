class Controllist {
  String? createdAt;
  String? createdBy;
  int? id;
  bool? isDeleted;
  bool? isMandatory;
  String? jsonId;
  String? modifiedAt;
  String? modifiedBy;
  String? name;
  int? parentId;
  String? type;
  int? wFormId;

  Controllist(
      {this.createdAt,
      this.createdBy,
      this.id,
      this.isDeleted,
      this.isMandatory,
      this.jsonId,
      this.modifiedAt,
      this.modifiedBy,
      this.name,
      this.parentId,
      this.type,
      this.wFormId});

  factory Controllist.fromJson(Map<String, dynamic> json) {
    return Controllist(
      createdAt: json['createdAt'] != null ? json['createdAt'] : null,
      createdBy: json['createdBy'] != null ? json['createdBy'] : null,
      id: json['id'] != null ? json['id'] : null,
      isDeleted: json['isDeleted'] != null ? json['isDeleted'] : null,
      isMandatory: json['isMandatory'] != null ? json['isMandatory'] : null,
      jsonId: json['jsonId'] != null ? json['jsonId'] : null,
      modifiedAt: json['modifiedAt'] != null ? json['modifiedAt'] : null,
      modifiedBy: json['modifiedBy'] != null ? json['modifiedBy'] : null,
      name: json['name'] != null ? json['name'] : null,
      parentId: json['parentId'] != null ? json['parentId'] : null,
      type: json['type'] != null ? json['type'] : null,
      wFormId: json['wFormId'] != null ? json['wFormId'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['id'] = this.id;
    data['isDeleted'] = this.isDeleted;
    data['isMandatory'] = this.isMandatory;
    data['jsonId'] = this.jsonId;
    data['modifiedBy'] = this.modifiedBy;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    data['type'] = this.type;
    data['wFormId'] = this.wFormId;
    data['modifiedAt'] = this.modifiedAt;

    return data;
  }
}
