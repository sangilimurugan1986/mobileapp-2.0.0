class MatrixRowX {
  String? id;
  String? label;

  MatrixRowX({this.id, this.label});

  factory MatrixRowX.fromJson(Map<String, dynamic> json) {
    return MatrixRowX(
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
