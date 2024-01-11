class MatrixRow {
  String? id;
  String? label;

  MatrixRow({this.id, this.label});

  factory MatrixRow.fromJson(Map<String, dynamic> json) {
    return MatrixRow(
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
