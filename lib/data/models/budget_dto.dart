import 'package:happy_money/data/models/wallet_dto.dart';
import 'package:hive/hive.dart';
import 'category_dto.dart';
part 'budget_dto.g.dart';

@HiveType(typeId: 3)
class BudgetDTO {
  BudgetDTO({
    this.amount,
    this.category,
    this.note,
    this.createdAt,
    this.wallet,
    required this.uniqueKey,
    this.fromDate,
    this.toDate,
  });

  @HiveField(30)
  late int? amount;

  @HiveField(31)
  late CategoryDTO? category;

  @HiveField(32)
  late String? note;

  @HiveField(33)
  late DateTime? createdAt;

  @HiveField(34)
  late WalletDTO? wallet;

  @HiveField(35)
  late String uniqueKey;

  @HiveField(36)
  late DateTime? fromDate;

  @HiveField(37)
  late DateTime? toDate;

  @override
  List<Object?> get props =>
      [amount, category, note, createdAt, wallet, uniqueKey, fromDate, toDate];
}
