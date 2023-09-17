// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactionn_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransactionDTOAdapter extends TypeAdapter<TransactionDTO> {
  @override
  final int typeId = 2;

  @override
  TransactionDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TransactionDTO(
      amount: fields[20] as int?,
      category: fields[21] as CategoryDTO?,
      note: fields[22] as String?,
      createdAt: fields[23] as DateTime?,
      wallet: fields[24] as WalletDTO?,
      uniqueKey: fields[25] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TransactionDTO obj) {
    writer
      ..writeByte(6)
      ..writeByte(20)
      ..write(obj.amount)
      ..writeByte(21)
      ..write(obj.category)
      ..writeByte(22)
      ..write(obj.note)
      ..writeByte(23)
      ..write(obj.createdAt)
      ..writeByte(24)
      ..write(obj.wallet)
      ..writeByte(25)
      ..write(obj.uniqueKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransactionDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
