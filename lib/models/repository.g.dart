// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) {
  return Repository(
    description: json['description'] as String,
    id: json['id'] as int,
    isDeleted: json['isDeleted'] as bool,
    isWorkflowRepository: json['isWorkflowRepository'] as bool,
    modifiedAt: json['modifiedAt'] as String,
    modifiedBy: json['modifiedBy'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'description': instance.description,
      'id': instance.id,
      'isDeleted': instance.isDeleted,
      'isWorkflowRepository': instance.isWorkflowRepository,
      'modifiedAt': instance.modifiedAt,
      'modifiedBy': instance.modifiedBy,
      'name': instance.name,
    };
