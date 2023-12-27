// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nodule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Nodule _$NoduleFromJson(Map<String, dynamic> json) {
  return Nodule(
    id: json['id'] as int,
    name: json['name'] as String,
    type: _$enumDecode(_$NoduleTypeEnumMap, json['type']),
    size: json['size'] as int,
    noduleId: json['noduleId'] as int,
    itemsCount: json['itemsCount'] as int,
    modifiedBy: json['modifiedBy'] as String,
    modifiedAt: json['modifiedAt'] as String,
    repositoryId: json['repositoryId'] as int,
  );
}

Map<String, dynamic> _$NoduleToJson(Nodule instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$NoduleTypeEnumMap[instance.type],
      'size': instance.size,
      'noduleId': instance.noduleId,
      'itemsCount': instance.itemsCount,
      'modifiedBy': instance.modifiedBy,
      'modifiedAt': instance.modifiedAt,
      'repositoryId': instance.repositoryId,
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

const _$NoduleTypeEnumMap = {
  NoduleType.Repository: 'Repository',
  NoduleType.Folder: 'Folder',
  NoduleType.File: 'File',
};
