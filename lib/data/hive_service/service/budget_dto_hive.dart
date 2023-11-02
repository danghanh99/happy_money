import '../../models/budget_dto.dart';
import '../../models/category_dto.dart';
import '../../models/wallet_dto.dart';
import '../boxes.dart';
import 'hive_service.dart';

class BudgetDTOHive {
  static Future<int> addBudgetDTO({
    required bool isMainBudget,
    required int amount,
    CategoryDTO? category,
    required String note,
    required DateTime createdAt,
    required WalletDTO wallet,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    final box = Boxes.getBoxBudgetDTO();

    final budgetDTO = BudgetDTO(
      amount: amount,
      category: category,
      note: note,
      createdAt: createdAt,
      wallet: wallet,
      uniqueKey: generateUnikeyBudget(),
      fromDate: fromDate,
      toDate: toDate,
    );
    box.add(budgetDTO);
    return 1;
  }

  static String generateUnikeyBudget() {
    final box = Boxes.getBoxBudgetDTO();
    String uniqueKey = HiveService().generateUniquekey(box);
    return uniqueKey;
  }

  static BudgetDTO findBudgetDTO(String uniqueKey) {
    final box = Boxes.getBoxBudgetDTO();
    return box.values
        .toList()
        .firstWhere((element) => element.uniqueKey == uniqueKey);
  }

  static void findToCreateOrUpdateBudgetDTO(BudgetDTO inputTrans) {
    final box = Boxes.getBoxBudgetDTO();

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
