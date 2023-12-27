import 'package:json_annotation/json_annotation.dart';

part 'ticket_form_field.g.dart';

@JsonSerializable(explicitToJson: true)
class TicketFormField {
  TicketFormField({
    required this.id,
    required this.name,
    required this.type,
    this.typeId = 0,
    required this.options,
    required this.mandatory,
    required this.textColor,
    required this.fontSize,
  });

  factory TicketFormField.fromJson(Map<String, dynamic> json) =>
      _$TicketFormFieldFromJson(json);

  final String id;
  final String name;
  final String type;
  int? typeId;
  final String options;
  final bool mandatory;
  final String textColor;
  final double fontSize;

  Map<String, dynamic> toJson() => _$TicketFormFieldToJson(this);
}
