import 'General.dart';
import 'Publish.dart';

class Settings {
  General? general;
  Publish? publish;
  List<Object>? rules;

  Settings({this.general, this.publish, this.rules});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      general:
          json['general'] != null ? General.fromJson(json['general']) : null,
      publish:
          json['publish'] != null ? Publish.fromJson(json['publish']) : null,
      rules: json['rules'] != null
          ? (json['rules'] as List).map((i) => Object).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.general != null) {
      data['general'] = this.general?.toJson();
    }
    if (this.publish != null) {
      data['publish'] = this.publish?.toJson();
    }
    if (this.rules != null) {
      data['rules'] = this.rules?.map((v) => v).toList();
    }
    return data;
  }
}
