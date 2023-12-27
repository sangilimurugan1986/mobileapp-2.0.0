import 'PanelX.dart';
import 'SecondaryPanel.dart';
import 'Settings.dart';

class Panel {
  bool? isDeleted;
  List<PanelX>? panels;
  List<SecondaryPanel>? secondaryPanels;
  Settings? settings;
  String? uid;

  Panel(
      {this.isDeleted,
      this.panels,
      this.secondaryPanels,
      this.settings,
      this.uid});

  factory Panel.fromJson(Map<String, dynamic> json) {
    return Panel(
      isDeleted: json['isDeleted'],
      panels: json['panels'] != null
          ? (json['panels'] as List).map((i) => PanelX.fromJson(i)).toList()
          : null,
      secondaryPanels: json['secondaryPanels'] != null
          ? (json['secondaryPanels'] as List)
              .map((i) => SecondaryPanel.fromJson(i))
              .toList()
          : null,
      settings:
          json['settings'] != null ? Settings.fromJson(json['settings']) : null,
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['uid'] = this.uid;
    if (this.panels != null) {
      data['panels'] = this.panels?.map((v) => v.toJson()).toList();
    }
    if (this.secondaryPanels != null) {
      data['secondaryPanels'] =
          this.secondaryPanels?.map((v) => v.toJson()).toList();
    }
    if (this.settings != null) {
      data['settings'] = this.settings?.toJson();
    }
    return data;
  }
}
