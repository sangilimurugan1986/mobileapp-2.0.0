import 'package:json_annotation/json_annotation.dart';

import '../utils/nodule_type.dart';

part 'nodule.g.dart';

@JsonSerializable()
class Nodule {
  const Nodule({
    required this.id,
    required this.name,
    required this.type,
    required this.size,
    required this.noduleId,
    required this.itemsCount,
    required this.modifiedBy,
    required this.modifiedAt,
    required this.repositoryId,
  });

  factory Nodule.empty() => const Nodule(
        id: 0,
        name: '',
        type: NoduleType.Repository,
        size: 0,
        noduleId: 0,
        itemsCount: 1,
        modifiedBy: '',
        modifiedAt: '',
        repositoryId: 0,
      );

  factory Nodule.fromJson(Map<String, dynamic> json) => _$NoduleFromJson(json);

  final int id;
  final String name;
  final NoduleType type;
  final int size;
  final int noduleId;
  final int itemsCount;
  final String modifiedBy;
  final String modifiedAt;
  final int repositoryId;

  Map<String, dynamic> toJson() => _$NoduleToJson(this);
}
