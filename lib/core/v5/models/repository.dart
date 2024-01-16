import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable(explicitToJson: true)
class Repository {
  const Repository({
    required this.description,
    required this.id,
    required this.isDeleted,
    required this.isWorkflowRepository,
    required this.modifiedAt,
    required this.modifiedBy,
    required this.name,
  });

  factory Repository.empty() => const Repository(
        description: '',
        id: 0,
        isDeleted: false,
        isWorkflowRepository: false,
        modifiedAt: '',
        modifiedBy: '',
        name: '',
      );

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  final String description;
  final int id;
  final bool isDeleted;
  final bool isWorkflowRepository;
  final String modifiedAt;
  final String modifiedBy;
  final String name;

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
