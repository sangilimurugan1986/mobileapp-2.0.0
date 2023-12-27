import 'package:json_annotation/json_annotation.dart';

import '../utils/data_type.dart';

part 'repository_field.g.dart';

@JsonSerializable(explicitToJson: true)
class RepositoryField {
  const RepositoryField({
    required this.id,
    required this.name,
    required this.type,
    required this.typeId,
    required this.tableName,
    required this.isMandatory,
  });

  factory RepositoryField.empty() => const RepositoryField(
        id: 0,
        name: '',
        type: DataType.AlphaNumeric,
        typeId: 0,
        tableName: '',
        isMandatory: false,
      );

  factory RepositoryField.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFieldFromJson(json);

  final int id;
  final String name;
  final DataType type;
  final int typeId;
  final String tableName;
  final bool isMandatory;

  Map<String, dynamic> toJson() => _$RepositoryFieldToJson(this);
}
