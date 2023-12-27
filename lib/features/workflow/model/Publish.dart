class Publish {
  String? publishOption;
  String? publishSchedule;
  String? unpublishSchedule;

  Publish({this.publishOption, this.publishSchedule, this.unpublishSchedule});

  factory Publish.fromJson(Map<String, dynamic> json) {
    return Publish(
      publishOption: json['publishOption'],
      publishSchedule: json['publishSchedule'],
      unpublishSchedule: json['unpublishSchedule'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['publishOption'] = this.publishOption;
    data['publishSchedule'] = this.publishSchedule;
    data['unpublishSchedule'] = this.unpublishSchedule;
    return data;
  }
}
