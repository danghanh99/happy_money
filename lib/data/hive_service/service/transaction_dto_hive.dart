import '../../models/category_dto.dart';
import '../../models/transactionn_dto.dart';
import '../../models/wallet_dto.dart';
import '../boxes.dart';
import 'hive_service.dart';

class TransactionDTOHive {
  static Future<int> addTransactionDTO({
    required bool isMainTransaction,
    required int amount,
    CategoryDTO? category,
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
      uniqueKey: generateUnikeyTransaction(),
    );
    box.add(transactionDTO);
    return 1;
  }

  static String generateUnikeyTransaction() {
    final box = Boxes.getBoxTransactionDTO();
    String uniqueKey = HiveService().generateUniquekey(box);
    return uniqueKey;
  }

  static TransactionDTO findTransactionDTO(String uniqueKey) {
    final box = Boxes.getBoxTransactionDTO();
    return box.values
        .toList()
        .firstWhere((element) => element.uniqueKey == uniqueKey);
  }

  static void findToCreateOrUpdateTransactionDTO(TransactionDTO inputTrans) {
    final box = Boxes.getBoxTransactionDTO();

    int index = box.values
        .toList()
        .indexWhere((element) => element.uniqueKey == inputTrans.uniqueKey);

    if (index < 0) {
      box.add(inputTrans);
    } else {
      box.putAt(index, inputTrans);
    }
  }
}
