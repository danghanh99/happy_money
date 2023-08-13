// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WalletDTOAdapter extends TypeAdapter<WalletDTO> {
  @override
  final int typeId = 0;

  @override
  WalletDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WalletDTO(
      name: fields[0] as String,
      iconPath: fields[1] as String?,
      isMainWallet: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WalletDTO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.iconPath)
      ..writeByte(2)
      ..write(obj.isMainWallet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WalletDTOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
