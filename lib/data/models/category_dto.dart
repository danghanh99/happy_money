import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_dto.g.dart';

@HiveType(typeId: 1)
class CategoryDTO {
  CategoryDTO({
    required this.name,
    this.iconPath,
    required this.colorValue,
    required this.isSpending,
  });

  @HiveField(10)
  @JsonKey(name: 'name', required: true)
  late String name;

  @HiveField(11)
  @JsonKey(name: 'iconPath', required: false)
  late String? iconPath;

  @HiveField(12)
  @JsonKey(name: 'colorValue', required: false)
  late int? colorValue;

  @HiveField(13)
  @JsonKey(name: 'isSpending', required: true)
  late bool isSpending;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) => CategoryDTO(
        name: json['name'],
        iconPath: json['iconPath'],
        colorValue: json['colorValue'],
        isSpending: json['isSpending'],
      );

  @override
  List<Object?> get props => [
        name,
        iconPath,
        colorValue,
        isSpending,
      ];
}
