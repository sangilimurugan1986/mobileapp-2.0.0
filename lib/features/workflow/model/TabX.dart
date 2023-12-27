class TabX {
  String? id;
  String? label;
  int? panel;
  String? value;

  TabX({this.id, this.label, this.panel, this.value});

  factory TabX.fromJson(Map<String, dynamic> json) {
    return TabX(
      id: json['id'],
      label: json['label'],
      panel: json['panel'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['panel'] = this.panel;
    data['value'] = this.value;
    return data;
  }
}
