import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:hive/hive.dart';
import 'category_dto.dart';
part 'transactionn_dto.g.dart';

@HiveType(typeId: 2)
class TransactionDTO {
  TransactionDTO({
    this.amount,
    this.category,
    this.note,
    this.createdAt,
    this.wallet,
    required this.uniqueKey,
  });

  @HiveField(20)
  late int? amount;

  @HiveField(21)
  late CategoryDTO? category;

  @HiveField(22)
  late String? note;

  @HiveField(23)
  late DateTime? createdAt;

  @HiveField(24)
  late WalletDTO? wallet;

  @HiveField(25)
  late String uniqueKey;

  @override
  List<Object?> get props =>
      [amount, category, note, createdAt, wallet, uniqueKey];
}
