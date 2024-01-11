import 'package:ez/features/tasklist/model/SortBy.dart';

import 'FilterBy.dart';

class TaskRequest {
  int? currentPage;
  List<FilterBy>? filterBy;
  String? groupBy;
  int? itemsPerPage;
  String? mode;
  SortBy? sortBy;

  TaskRequest(
      {this.currentPage,
      this.filterBy,
      this.groupBy,
      this.itemsPerPage,
      this.mode,
      this.sortBy});

  factory TaskRequest.fromJson(Map<String, dynamic> json) {
    return TaskRequest(
      currentPage: json['currentPage'],
      filterBy: json['filterBy'] != null
          ? (json['filterBy'] as List).map((i) => FilterBy.fromJson(i)).toList()
          : null,
      groupBy: json['groupBy'],
      itemsPerPage: json['itemsPerPage'],
      mode: json['mode'],
      sortBy: json['sortBy'] != null ? SortBy.fromJson(json['sortBy']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['groupBy'] = this.groupBy;
    data['itemsPerPage'] = this.itemsPerPage;
    data['mode'] = this.mode;
    if (this.filterBy != null) {
      data['filterBy'] = this.filterBy?.map((v) => v.toJson()).toList();
    }
    if (this.sortBy != null) {
      data['sortBy'] = this.sortBy?.toJson();
    }
    return data;
  }
}
