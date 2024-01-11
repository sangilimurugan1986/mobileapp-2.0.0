//import 'SettingsX.dart';

class SubDetails {
  String? workspace;
  String? fieldsType;
  String? files;
  String? size;

  //SubDetails({this.workspace, this.fieldsType, this.settings, this.files});
  SubDetails({this.workspace, this.fieldsType, this.files, this.size});
  factory SubDetails.fromJson(Map<String, dynamic> json) {
    return SubDetails(
        workspace: json['workspace'],
        fieldsType: json['fieldsType'],
        files: json['filesCount'],
        size: json['fileSize']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workspace'] = this.workspace;
    data['fieldsType'] = this.fieldsType;
    data['files'] = this.files;
    data['fileSize'] = this.size;
    return data;
  }
}
