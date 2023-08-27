import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_dto.g.dart';

@HiveType(typeId: 1)
class CategoryDTO {
  CategoryDTO({
    required this.name,
    this.iconPath,
  });

  @HiveField(10)
  @JsonKey(name: 'name', required: true)
  late String name;

  @HiveField(11)
  @JsonKey(name: 'iconPath', required: false)
  late String? iconPath;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
        name: json['name'],
        iconPath: json['iconPath'],
      );

  @override
  List<Object?> get props => [
        name,
        iconPath,
      ];
}
