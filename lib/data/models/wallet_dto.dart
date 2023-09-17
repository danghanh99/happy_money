import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wallet_dto.g.dart';

@HiveType(typeId: 0)
class WalletDTO {
  WalletDTO({
    required this.name,
    this.iconPath,
    required this.isMainWallet,
    required this.uniqueKey,
  });

  @HiveField(00)
  @JsonKey(name: 'name', required: true)
  late String name;

  @HiveField(01)
  @JsonKey(name: 'iconPath', required: false)
  late String? iconPath;

  @HiveField(02)
  @JsonKey(name: 'isMainWallet', required: true)
  late bool isMainWallet;

  @HiveField(03)
  @JsonKey(name: 'uniqueKey', required: true)
  late String uniqueKey;

  factory WalletDTO.fromJson(Map<String, dynamic> json) => WalletDTO(
        name: json['name'],
        iconPath: json['iconPath'],
        isMainWallet: json['isMainWallet'],
        uniqueKey: json['uniqueKey'],
      );

  @override
  List<Object?> get props => [name, iconPath, isMainWallet, uniqueKey];
}
