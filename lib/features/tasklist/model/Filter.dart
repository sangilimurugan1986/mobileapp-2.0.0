class Filter {
  String? condition;
  String? criteria;
  String? dataType;
  String? value;

  Filter({this.condition, this.criteria, this.dataType, this.value});

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      condition: json['condition'],
      criteria: json['criteria'],
      dataType: json['dataType'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['condition'] = this.condition;
    data['criteria'] = this.criteria;
    data['dataType'] = this.dataType;
    data['value'] = this.value;
    return data;
  }
}
