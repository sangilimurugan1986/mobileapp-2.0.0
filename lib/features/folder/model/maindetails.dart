class MainDetails {
  String? name;
  String? description;

  MainDetails({this.name, this.description});

  factory MainDetails.fromJson(Map<String, dynamic> json) {
    return MainDetails(
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
