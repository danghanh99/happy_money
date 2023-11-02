import 'package:happy_money/data/models/budget_dto.dart';
import 'package:happy_money/data/models/category_dto.dart';
import 'package:hive/hive.dart';
import '../models/transactionn_dto.dart';
import '../models/wallet_dto.dart';

class Boxes {
  void box() {}
  static Box<WalletDTO> getBoxWalletDTO() =>
      Hive.box<WalletDTO>('WalletDTOBox');
  static Box<CategoryDTO> getBoxCategoryDTO() =>
      Hive.box<CategoryDTO>('CategoryDTOBox');
  static Box<TransactionDTO> getBoxTransactionDTO() =>
      Hive.box<TransactionDTO>('TransactionDTOBox');
  static Box<BudgetDTO> getBoxBudgetDTO() =>
      Hive.box<BudgetDTO>('BudgetDTOBox');
}
