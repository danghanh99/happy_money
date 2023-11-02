// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BudgetDTOAdapter extends TypeAdapter<BudgetDTO> {
  @override
  final int typeId = 3;

  @override
  BudgetDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BudgetDTO(
      amount: fields[30] as int?,
      category: fields[31] as CategoryDTO?,
      note: fields[32] as String?,
      createdAt: fields[33] as DateTime?,
      wallet: fields[34] as WalletDTO?,
      uniqueKey: fields[35] as String,
      fromDate: fields[36] as DateTime?,
      toDate: fields[37] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BudgetDTO obj) {
    writer
      ..writeByte(8)
      ..writeByte(30)
      ..write(obj.amount)
      ..writeByte(31)
      ..write(obj.category)
      ..writeByte(32)
      ..write(obj.note)
      ..writeByte(33)
      ..write(obj.createdAt)
      ..writeByte(34)
      ..write(obj.wallet)
      ..writeByte(35)
      ..write(obj.uniqueKey)
      ..writeByte(36)
      ..write(obj.fromDate)
      ..writeByte(37)
      ..write(obj.toDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BudgetDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
