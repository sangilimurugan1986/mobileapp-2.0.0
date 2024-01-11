import 'package:ez/features/workflow/model/SettingsX.dart';

class TableColumn {
  String? id;
  String? label;
  SettingsX? settings;
  String? size;
  String? type;

  TableColumn({this.id, this.label, this.settings, this.size, this.type});

  factory TableColumn.fromJson(Map<String, dynamic> json) {
    return TableColumn(
      id: json['id'],
      label: json['label'],
      settings: json['settings'] != null
          ? SettingsX.fromJson(json['settings'])
          : null,
      size: json['size'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['size'] = this.size;
    data['type'] = this.type;
    if (this.settings != null) {
      data['settings'] = this.settings?.toJson();
    }
    return data;
  }
}
