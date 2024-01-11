class Nested {
  List<Object>? children;
  String? id;
  String? label;
  int? level;
  bool? showChildren;

  Nested({this.children, this.id, this.label, this.level, this.showChildren});

  factory Nested.fromJson(Map<String, dynamic> json) {
    return Nested(
      children: json['children'] != null
          ? (json['children'] as List).map((i) => Object).toList()
          : null,
      id: json['id'],
      label: json['label'],
      level: json['level'],
      showChildren: json['showChildren'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['level'] = this.level;
    data['showChildren'] = this.showChildren;
    if (this.children != null) {
      data['children'] = this.children?.map((v) => v).toList();
    }
    return data;
  }
}
