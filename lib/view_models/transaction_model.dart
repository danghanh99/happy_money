import 'package:happy_money/data/models/transactionn_dto.dart';

import '../data/models/category_dto.dart';
import '../data/models/wallet_dto.dart';

class TransactionModel {
  int? amount;

  CategoryDTO? category;

  String? note;

  DateTime? createdAt;

  WalletDTO? wallet;

  TransactionModel({
    this.amount,
    this.category,
    this.note,
    this.createdAt,
    this.wallet,
  });

  TransactionModel convertToTransactionModel(TransactionDTO trans) {
    TransactionModel newTra = TransactionModel();
    newTra.amount = trans.amount;
    newTra.category = trans.category;
    newTra.note = trans.note;
    newTra.createdAt = trans.createdAt;
    newTra.wallet = trans.wallet;
    return newTra;
  }
}
