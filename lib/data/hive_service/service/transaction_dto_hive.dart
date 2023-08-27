import '../../models/category_dto.dart';
import '../../models/transactionn_dto.dart';
import '../../models/wallet_dto.dart';
import '../boxes.dart';

class TransactionDTOHive {
  static Future<int> addTransactionDTO({
    required bool isMainTransaction,
    required int amount,
    required CategoryDTO category,
    required String note,
    required DateTime createdAt,
    required WalletDTO wallet,
  }) async {
    final box = Boxes.getBoxTransactionDTO();
    final transactionDTO = TransactionDTO(
      amount: amount,
      category: category,
      note: note,
      createdAt: createdAt,
      wallet: wallet,
    );
    box.add(transactionDTO);
    return 1;
  }
}
