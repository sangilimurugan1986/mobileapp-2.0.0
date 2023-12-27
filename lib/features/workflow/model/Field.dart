import 'SettingsX.dart';

class Field {
  String? id;
  String? label;
  SettingsX? settings;
  String? type;

  Field({this.id, this.label, this.settings, this.type});

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'],
      label: json['label'],
      settings: json['settings'] != null
          ? SettingsX.fromJson(json['settings'])
          : null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['type'] = this.type;
    if (this.settings != null) {
      data['settings'] = this.settings?.toJson();
    }
    return data;
  }
}
