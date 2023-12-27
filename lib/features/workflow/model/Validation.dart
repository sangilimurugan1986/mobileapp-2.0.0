class Validation {
  List<Object>? allowedFileTypes;
  String? contentRule;
  List<Object>? enableSettings;
  String? fieldRule;
  int? maxFileSize;
  String? maximum;
  String? minimum;

  Validation(
      {this.allowedFileTypes,
      this.contentRule,
      this.enableSettings,
      this.fieldRule,
      this.maxFileSize,
      this.maximum,
      this.minimum});

  factory Validation.fromJson(Map<String, dynamic> json) {
    return Validation(
      allowedFileTypes: json['allowedFileTypes'] != null
          ? (json['allowedFileTypes'] as List).map((i) => Object).toList()
          : null,
      contentRule: json['contentRule'] != null ? json['contentRule'] : "",
      enableSettings: json['enableSettings'] != null
          ? (json['enableSettings'] as List).map((i) => Object).toList()
          : null,
      fieldRule: json['fieldRule'],
      maxFileSize: json['maxFileSize'],
      maximum: json['maximum'],
      minimum: json['minimum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentRule'] = this.contentRule;
    data['fieldRule'] = this.fieldRule;
    data['maxFileSize'] = this.maxFileSize;
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    if (this.allowedFileTypes != null) {
      data['allowedFileTypes'] = this.allowedFileTypes?.map((v) => v).toList();
    }
    if (this.enableSettings != null) {
      data['enableSettings'] = this.enableSettings?.map((v) => v).toList();
    }
    return data;
  }
}
