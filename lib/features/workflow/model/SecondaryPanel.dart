import 'SettingsXX.dart';

class SecondaryPanel {
  List<Object>? fields;
  String? id;
  SettingsXX? settings;

  SecondaryPanel({this.fields, this.id, this.settings});

  factory SecondaryPanel.fromJson(Map<String, dynamic> json) {
    return SecondaryPanel(
      fields: json['fields'] != null
          ? (json['fields'] as List).map((i) => Object).toList()
          : null,
      id: json['id'],
      settings: json['settings'] != null
          ? SettingsXX.fromJson(json['settings'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.fields != null) {
      data['fields'] = this.fields?.map((v) => v).toList();
    }
    if (this.settings != null) {
      data['settings'] = this.settings?.toJson();
    }
    return data;
  }
}
