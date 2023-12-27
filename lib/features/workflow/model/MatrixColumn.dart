class MatrixColumn {
  String? id;
  String? label;

  MatrixColumn({this.id, this.label});

  factory MatrixColumn.fromJson(Map<String, dynamic> json) {
    return MatrixColumn(
      id: json['id'],
      label: json['label'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    return data;
  }
}
