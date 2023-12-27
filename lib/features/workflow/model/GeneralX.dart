class GeneralX {
  String? dividerType;
  bool? hideLabel;
  String? placeholder;
  String? size;
  String? tooltip;
  String? visibility;

  GeneralX(
      {this.dividerType,
      this.hideLabel,
      this.placeholder,
      this.size,
      this.tooltip,
      this.visibility});

  factory GeneralX.fromJson(Map<String, dynamic> json) {
    return GeneralX(
      dividerType: json['dividerType'],
      hideLabel: json['hideLabel'],
      placeholder: json['placeholder'],
      size: json['size'],
      tooltip: json['tooltip'],
      visibility: json['visibility'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dividerType'] = this.dividerType;
    data['hideLabel'] = this.hideLabel;
    data['placeholder'] = this.placeholder;
    data['size'] = this.size;
    data['tooltip'] = this.tooltip;
    data['visibility'] = this.visibility;
    return data;
  }
}
