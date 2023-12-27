class NestedX {
  // List<Object>? children;
  String? id;
  String? label;
  int? level;
  bool? showChildren;

  NestedX({this.id, this.label, this.level, this.showChildren});

  factory NestedX.fromJson(Map<String, dynamic> json) {
    return NestedX(
      // children: json['children'] != null
      //     ? (json['children'] as List).map((i) => Object.fromJson(i)).toList()
      //     : null,
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
    // if (this.children != null) {
    //   data['children'] = this.children?.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
