// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_form_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketFormField _$TicketFormFieldFromJson(Map<String, dynamic> json) {
  return TicketFormField(
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    typeId: json['typeId'] as int?,
    options: json['options'] as String,
    mandatory: json['mandatory'] as bool,
    textColor: json['textColor'] as String,
    fontSize: (json['fontSize'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TicketFormFieldToJson(TicketFormField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'typeId': instance.typeId,
      'options': instance.options,
      'mandatory': instance.mandatory,
      'textColor': instance.textColor,
      'fontSize': instance.fontSize,
    };
