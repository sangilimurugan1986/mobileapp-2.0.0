// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryField _$RepositoryFieldFromJson(Map<String, dynamic> json) {
  return RepositoryField(
    id: json['id'] as int,
    name: json['name'] as String,
    type: _$enumDecode(_$DataTypeEnumMap, json['type']),
    typeId: json['typeId'] as int,
    tableName: json['tableName'] as String,
    isMandatory: json['isMandatory'] as bool,
  );
}

Map<String, dynamic> _$RepositoryFieldToJson(RepositoryField instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$DataTypeEnumMap[instance.type],
      'typeId': instance.typeId,
      'tableName': instance.tableName,
      'isMandatory': instance.isMandatory,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$DataTypeEnumMap = {
  DataType.Numeric: 'Numeric',
  DataType.AlphaNumeric: 'AlphaNumeric',
  DataType.SingleSelect: 'SingleSelect',
  DataType.Decimal: 'Decimal',
  DataType.Date: 'Date',
  DataType.Custom: 'Custom',
};
