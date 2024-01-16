// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryStats _$RepositoryStatsFromJson(Map<String, dynamic> json) {
  return RepositoryStats(
    processing: json['processing'] as int,
    indexing: json['indexing'] as int,
    indexed: json['indexed'] as int,
    archived: json['archived'] as int,
  );
}

Map<String, dynamic> _$RepositoryStatsToJson(RepositoryStats instance) =>
    <String, dynamic>{
      'processing': instance.processing,
      'indexing': instance.indexing,
      'indexed': instance.indexed,
      'archived': instance.archived,
    };
