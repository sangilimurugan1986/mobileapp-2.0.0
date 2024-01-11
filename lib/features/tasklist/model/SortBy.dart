class SortBy {
  String? criteria;
  String? order;

  SortBy({this.criteria, this.order});

  factory SortBy.fromJson(Map<String, dynamic> json) {
    return SortBy(
      criteria: json['criteria'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['criteria'] = this.criteria;
    data['order'] = this.order;
    return data;
  }
}
