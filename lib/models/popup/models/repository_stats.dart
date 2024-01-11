import 'package:json_annotation/json_annotation.dart';

part 'repository_stats.g.dart';

@JsonSerializable(explicitToJson: true)
class RepositoryStats {
  const RepositoryStats({
    required this.processing,
    required this.indexing,
    required this.indexed,
    required this.archived,
  });

  factory RepositoryStats.empty() => const RepositoryStats(
        processing: 0,
        indexing: 0,
        indexed: 0,
        archived: 0,
      );

  factory RepositoryStats.fromJson(Map<String, dynamic> json) =>
      _$RepositoryStatsFromJson(json);

  final int processing;
  final int indexing;
  final int indexed;
  final int archived;

  Map<String, dynamic> toJson() => _$RepositoryStatsToJson(this);
}
