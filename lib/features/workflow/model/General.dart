class General {
  String? description;
  String? layout;
  String? name;
  String? type;

  General({this.description, this.layout, this.name, this.type});

  factory General.fromJson(Map<String, dynamic> json) {
    return General(
      description: json['description'],
      layout: json['layout'],
      name: json['name'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['layout'] = this.layout;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}
