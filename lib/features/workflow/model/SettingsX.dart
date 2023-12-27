import 'package:ez/features/workflow/model/SpecificX.dart';

import 'GeneralX.dart';
import 'Specific.dart';
import 'Validation.dart';

class SettingsX {
  GeneralX? general;
  SpecificX? specific;
  Validation? validation;

  SettingsX({this.general, this.specific, this.validation});

  factory SettingsX.fromJson(Map<String, dynamic> json) {
    return SettingsX(
      general:
          json['general'] != null ? GeneralX.fromJson(json['general']) : null,
      specific: json['specific'] != null
          ? SpecificX.fromJson(json['specific'])
          : null,
      validation: json['validation'] != null
          ? Validation.fromJson(json['validation'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.general != null) {
      data['general'] = this.general?.toJson();
    }
    if (this.specific != null) {
      data['specific'] = this.specific?.toJson();
    }
    if (this.validation != null) {
      data['validation'] = this.validation?.toJson();
    }
    return data;
  }
}
