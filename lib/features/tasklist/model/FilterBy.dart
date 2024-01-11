import 'package:ez/features/tasklist/model/Filter.dart';

class FilterBy {
  List<Filter>? filters;
  String? groupCondition;

  FilterBy({this.filters, this.groupCondition});

  factory FilterBy.fromJson(Map<String, dynamic> json) {
    return FilterBy(
      filters: json['filters'] != null
          ? (json['filters'] as List).map((i) => Filter.fromJson(i)).toList()
          : null,
      groupCondition: json['groupCondition'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupCondition'] = this.groupCondition;
    if (this.filters != null) {
      data['filters'] = this.filters?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
