// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryDTOAdapter extends TypeAdapter<CategoryDTO> {
  @override
  final int typeId = 1;

  @override
  CategoryDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryDTO(
      name: fields[10] as String,
      iconPath: fields[11] as String?,
      colorValue: fields[12] as int?,
      isSpending: fields[13] as bool,
      uniqueKey: fields[14] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryDTO obj) {
    writer
      ..writeByte(5)
      ..writeByte(10)
      ..write(obj.name)
      ..writeByte(11)
      ..write(obj.iconPath)
      ..writeByte(12)
      ..write(obj.colorValue)
      ..writeByte(13)
      ..write(obj.isSpending)
      ..writeByte(14)
      ..write(obj.uniqueKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
