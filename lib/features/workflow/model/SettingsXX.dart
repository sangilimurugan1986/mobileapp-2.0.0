class SettingsXX {
  String? description;
  String? title;

  SettingsXX({this.description, this.title});

  factory SettingsXX.fromJson(Map<String, dynamic> json) {
    return SettingsXX(
      description: json['description'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}
